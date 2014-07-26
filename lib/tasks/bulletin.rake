namespace :data do
  desc "Fetch bulletin"
  task fetch_bulletin: :environment do
    require 'nokogiri'
    require 'open-uri'
    url = "http://www.nanotybp.jp/archive/release.asp"
    doc = Nokogiri::HTML(open(url))
    Bulletin.destroy_all
    content = doc.at_css(".NewsList .li_custom:first")
    date = content.css(".Date").text
    title = content.css(".Title").text
    Bulletin.create!(title: title, date: date)
    puts "cap nhat thanh cong"
  end
end