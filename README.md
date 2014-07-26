#SIDEKIQ
##Sidekiq là gì?
**sidekiq** là 1 background dùng để chạy một hoặc nhiều tiến trình mà người sử dụng muốn chạy ngầm vì nó mất nhiều thời gian xử lý tương tự như resque hay delay_job
**sidekiq** tương thích với rails3  và rails4, hỗ trợ ruby 1.9 trở lên, và Jruby 1.7
##Cài đặt
```gem install``` sidekiq or add ```gem "sidekiq"``` trong ```gemfile``` và ```bundle install```.


khi cài **sidekiq** thì chúng ta cần cài reddis server 2.4 trở lên trước vào trang ```http://redis.io/topics/quickstart``` để cài đặt.


##Các tính năng của sidekiq
Cũng như các background khác nó có các chức năng cơ bản như gửi mail, các công việc liên quan đến activerecord như chạy ngầm để làm các công việc như CRUD


Khả năng làm việc theo lịch tiến trình ví dụ như có thể cài đặt chạy một tiến trình vào lúc mấy giờ, và chạy lại nếu tiến trình lỗi hay là cho tiến trình nào chạy bao lần khi sai và delay bao lâu ...


Có thể chạy cron task khi kết hợp với clockword, whenever, sidekiq-cron hoặc sidetiq ...ở đây tôi sử dụng whenever


##Cài đặt whenever
add ```gem 'whenever', :require => false```



Chạy được cron task thì ta thêm file ```config/schedule.rb```
trong đó ta viết các function để config thời gian chạy các cron task
ví dụ như:
```Ruby
every 1.day, :at => '12:01 pm' do
  rake 'data:fetch_bulletin'
end
```
nghĩa là cron task rake 'data:fetch_bulletin' sẽ được chạy 1 ngày 1 lần vào 12h01
còn nếu muốn chạy trong worker thì dùng lệnh runner
```Ruby
runner 'Warehouse::FtpPull.perform_async'
```
Trong demo tôi giới thiệu 2 công việc mà thường được sử dụng trong chạy nền như gửi mail hay ```rake:task``` or cập nhật ```activerecord```
####Về gửi mail
tạo một file ```mailer/user_maile.rb```
```Ruby
class UserMailer < ActionMailer::Base
  default from: "ngvandung2010@gmail.com"

  def user_contact_email user
    mail = user.email
    mail(from: "ngvandung2010@gmail.com",
      to: mail, subject: "tao moi 1 xe")
  end
end
```
tạo file ```worker/user_mailer_send.rb```
```Ruby
class UserMailerSend
  include Sidekiq::Worker

  def perform car_id
    User.all.each do |user|
      UserMailer.user_contact_email(user).deliver
    end
  end
end
```
Để gọi các worker làm việc thì ra gọi như sau
```Ruby
UserMailerSend.perform_async @car.id
```
Config gửi mail thì ta config trong các file môi trường ```environments/development.rb```
```Ruby
config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'baci.lindsaar.net',
    :user_name            => 'ngvandung2010@gmail.com', #email default gửi đi
    :password             => 'ngaymaituoisang8990',	#pass email
    :authentication       => 'plain',
    :enable_starttls_auto => true  }
  
  config.action_mailer.default_url_options = {
    :host => "localhost:3000"
    }
```
####Chạy crontask
ở đây tôi làm về lấy dữ liệu của trang web khác update vào một bảng trong db của mình sử dụng whenever và nokogiri
add ```gem 'nokogiri', '~> 1.6.3.1'```
Dùng để lấy html của trang web mình muốn về.


Tạo file rake trong ```lid/tasks/bulletin.rake```
```Ruby
namespace :data do
  desc "Fetch product release"
  task fetch_products: :environment do
    require 'nokogiri'
    require 'open-uri'
    url = "http://www.nanotybp.jp/archive/release.asp"  //trang web mình muốn lấy nội dung
    doc = Nokogiri::HTML(open(url)) // lấy html
    NanotyCore::ProductRelease.destroy_all
    content = doc.at_css(".NewsList .li_custom:first") //at_css lấy nội dung tại vị trí tag như trên
    date = content.css(".Date").text // lấy text của thẻ có class là Date
    title = content.css(".Title").text
    NanotyCore::ProductRelease.create!(title: title, date: date)
    puts "cap nhat thanh cong"
  end
end
```
Chạy rake task như sau ```rake data:fetch_bulletin```
Nếu muốn lệnh rake trên chạy theo giờ mình muốn hay là chạy hằng ngày vaò lúc nào thì ta khai báo thời gian chạy trong file ```config/schedule.rb```
```Ruby
every 1.day, at: "7:00 am" do
  # chạy 1 ngày 1 lần vào 7h sáng
  rake "data:fetch_products"
end
```
