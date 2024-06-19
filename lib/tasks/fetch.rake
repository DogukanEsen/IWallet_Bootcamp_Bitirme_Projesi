
namespace :fetch do
  desc "Fetch users from JSONPlaceholder and save to the database"
  task users: :environment do
    require 'net/http'
    require 'json'

    Geo.destroy_all
    Address.destroy_all
    Company.destroy_all
    User.destroy_all

    url = 'https://jsonplaceholder.typicode.com/users'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    users = JSON.parse(response)

    users.each do |user_data|
      user = User.create(
        id: user_data['id'],
        name: user_data['name'],
        username: user_data['username'],
        email: user_data['email'],
        phone: user_data['phone'],
        website: user_data['website'],
        profile_photo_url: "https://picsum.photos/id/#{user_data['id']}/1000/1000"
      )

      address_data = user_data['address']
      address = Address.create(
        street: address_data['street'],
        suite: address_data['suite'],
        city: address_data['city'],
        zipcode: address_data['zipcode'],
        user: user
      )

      geo_data = address_data['geo']
      Geo.create(
        lat: geo_data['lat'],
        lng: geo_data['lng'],
        address: address
      )

      company_data = user_data['company']
      Company.create(
        name: company_data['name'],
        catchPhrase: company_data['catchPhrase'],
        bs: company_data['bs'],
        user: user
      )
    end
    puts "Users have been fetched and saved to the database."

  end

  task albums: :environment do
    require 'net/http'
    require 'json'

    Album.destroy_all

    url = 'https://jsonplaceholder.typicode.com/albums'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    albums = JSON.parse(response)

    albums.each do |album_data|
      Album.create(
        title: album_data['title'],
        user_id: album_data['userId']
      )
    end

    puts "Albums have been fetched and saved to the database."
  end
end
