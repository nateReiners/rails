# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
nate = User.create!(email: "nate.reiners@gmail.com")
sam = User.create!(email: "wjbrowneyed@gmail.com")


url1 = ShortenedUrl.create_for_user_and_long_url!(sam, 'www.google.com/longlong')
url2 = ShortenedUrl.create_for_user_and_long_url!(nate, 'www.google.com/longlonglonglong')

v = Visit.record_visit!(sam, url1)
v2 = Visit.record_visit!(sam, url1)
v3 = Visit.record_visit!(nate, url2)
v4 = Visit.record_visit!(sam, url2)
