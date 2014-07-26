# Learn more: http://github.com/javan/whenever
every 2.minutes do
  rake "data:fetch_bulletin"
end