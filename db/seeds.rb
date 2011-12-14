User.destroy_all
Package.destroy_all

user = User.create(
  :email => "user@jshq.org",
  :password => "password",
  :password_confirmation => "password")
user.confirm!

10.times do
  package = Package.create!(
    :name => Faker::Internet.user_name,
    :summary => Faker::Lorem.paragraph,
    :descripton => Faker::Lorem.paragraph)

  5.times do |i|
    package.versions.create!(
      :number => "0.0." + (i + 1).to_s,
      :packaged_file => File.open(Rails.root.join("spec", "fixtures", "sample.tar.gz")))
  end
end

Package.reindex
