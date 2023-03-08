# require 'json'
# require 'open-uri'

# # Define the Twitch API endpoint and headers
# endpoint = '<https://api.twitch.tv/helix/streams>'
# headers = { 'Client-ID' => 'xtfkk2e951rfmzi5an0ru8tgxx0vqr' }

# # Define an array of streamer usernames
# streamers = ['pokimane', 'soficious', 'badgerxxv']

# # Loop through each streamer and fetch their data from the API
# streamers.each do |streamer|
#   url = "#{endpoint}?user_login=#{streamer}"
#   response = JSON.parse(open(url, headers).read)['data'][0]
#   next unless response # Skip to the next iteration if the response is empty

#   # Extract the relevant data from the API response
#   user_id = response['user_id']
#   title = response['title']
#   viewer_count = response['viewer_count']

#   # Create a new user record for the streamer if one doesn't already exist
#   user = User.find_or_create_by(id: user_id)

#   # Create a new stream record for the streamer
#   stream = Stream.create(
#     user_id: user_id,
#     title: title,
#     viewer_count: viewer_count
#   )

#   # Fetch the stream's category from the API and create a new record for it
#   category_id = response['game_id']
#   category_url = "<https://api.twitch.tv/helix/games?id=#{category_id}>"
#   category_response = JSON.parse(open(category_url, headers).read)['data'][0]
#   next unless category_response # Skip to the next iteration if the response is empty

#   category = Category.find_or_create_by(
#     id: category_id,
#     name: category_response['name']
#   )

#   # Associate the stream with the category
#   stream.category = category
#   stream.average_viewers = 0
#   stream.peak_viewers = 0
#   stream.number_of_followers = 0
#   stream.number_of_subscriptions = 0
#   stream.number_of_chatters = 0
#   stream.number_of_chat_messages = 0

#   # Fetch the stream's data from the API and calculate the stats
#   while response do
#     if response['type'] == 'live'
#       viewer_count = response['viewer_count']

#       # Calculate Average Viewers
#       time = response['started_at']
#       started_at = DateTime.parse(time)
#       time = response['ended_at']
#       ended_at = DateTime.parse(time) if time

#       if !ended_at.nil?
#         duration = ended_at.to_i - started_at.to_i
#         intervals = duration / 1200 # 20 minutes

#         if intervals > 0
#           start_time = started_at
#           end_time = start_time + Rational(20, 1440) # 20 minutes in a day
#           total_viewers = 0

#           intervals.times do |i|
#             url = "#{endpoint}?user_login=#{streamer}&first=100&started_at=#{start_time.rfc3339}&ended_at=#{end_time.rfc3339}"
#             response = JSON.parse(open(url, headers).read)['data']

#             response.each do |data|
#               total_viewers += data['viewer_count']
#             end

#             start_time = end_time
#             end_time += Rational(20, 1440)
#           end

#           average_viewers = total_viewers / intervals
#           stream.average_viewers = average_viewers
#         end
#       end

#       if viewer_count > stream.peak_viewers
#         stream.peak_viewers = viewer_count
#       end

#       # Calculate Number of Followers and Subscriptions
#       followers_url = "<https://api.twitch.tv/helix/users/follows?to_id=#{user_id}>"
#       followers_response = JSON.parse(open(followers_url, headers).read)['data']

#       if !followers_response.empty?
#         last_follow_timestamp = followers_response.last['followed_at']
#         first_follow_timestamp = followers_response.first['followed_at']
#         last_follow_count = followers_response.last['from_id']
#         first_follow_count = followers_response.first['from_id']
#         stream.number_of_followers = last_follow_count - first_follow_count
#       end

#       subscriptions_url = "<https://api.twitch.tv/helix/subscriptions?broadcaster_id=#{user_id}>"
#       subscriptions_response = JSON.parse(open(subscriptions_url, headers).read)['data']

#       if !subscriptions_response.empty?
#         last_sub_timestamp = subscriptions_response.last['created_at']
#         first_sub_timestamp = subscriptions_response.first['created_at']
#         last_sub_count = subscriptions_response.last['subscriber_id']
#         first_sub_count = subscriptions_response.first['subscriber_id']
#         stream.number_of_subscriptions = last_sub_count - first_sub_count
#       end

#       # Calculate Number of Chatters and Chat Messages
#       chatters_url = "<https://tmi.twitch.tv/group/user/#{streamer}/chatters>"
#       chatters_response = JSON.parse(open(chatters_url).read)

#       if !chatters_response.nil?
#         chatters = chatters_response['chatters']
#         stream.number_of_chatters = chatters.values.flatten.count
#       end

#       chat_messages_url = "<https://api.twitch.tv/helix/chat/messages?broadcaster_id=#{user_id}>"
#       chat_messages_response = JSON.parse(open(chat_messages_url, headers).read)['data']
#       stream.number_of_chat_messages = chat_messages_response.count
#     end

#     response = JSON.parse(open(url, headers).read)['data'][0]
#   end

#   stream.save
# end

# # Define the Twitch API endpoint and headers
# endpoint = '<https://api.twitch.tv/helix/games>'
# headers = { 'Client-ID' => 'xtfkk2e951rfmzi5an0ru8tgxx0vqr' }

# # Define an array of categories or games
# categories = ['League of Legends', 'Fortnite', 'Valorant']

# # Loop through each category or game and fetch its data from the API
# categories.each do |category|
#   url = "#{endpoint}?name=#{category}"
#   response = JSON.parse(open(url, headers).read)['data'][0]
#   next unless response # Skip to the next iteration if the response is empty

#   # Extract the relevant data from the API response
#   id = response['id']
#   name = response['name']
#   box_art_url = response['box_art_url'].gsub('{width}', '300').gsub('{height}', '300')
#   rank = 0
#   average_viewers = 0
#   peak_viewers = 0
#   peak_viewers_date = nil

#   # Create a new category record
#   category = Category.find_or_create_by(
#     id: id,
#     name: name,
#     box_art_url: box_art_url,
#     rank: rank,
#     average_viewers: average_viewers,
#     peak_viewers: peak_viewers,
#     peak_viewers_date: peak_viewers_date
#   )

#   # Fetch the category's data from the API and calculate the stats
#   response = JSON.parse(open(url, headers)
# end

puts "Restoring DB"

puts "..."
sleep 1.5
puts "..."

Clip.destroy_all
Stream.destroy_all
Category.destroy_all
User.destroy_all

puts "DB reset"

puts "Creating some users"
user1 = User.create(email: 'alexandre0grande@twitch.tv', password: 'alexandre', display_name: 'alexandre0grande', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/0b31cfd4-e60b-43bf-b1a1-19e4df9a02be-profile_image-300x300.png', created_at: '21-04-2020')
user2 = User.create(email: 'pokimane@twitch.tv', password: 'pokimane', display_name: 'pokimane', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/6cd4de40-1a83-46c7-aea5-3bd73f90e7e4-profile_image-300x300.png', created_at: '14-02-2016')
user3 = User.create(email: 'soficious@twitch.tv', password: 'soficious', display_name: 'soficious', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/1ff9ccec-1f47-4b0b-9c5e-6cded0ed1dac-profile_image-300x300.png', created_at: '30-09-2021')
user4 = User.create(email: 'xqc@twitch.tv', password: 'xqctwitch', display_name: 'xqc', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/xqc-profile_image-9298dca608632101-300x300.jpeg', created_at: '01-01-2015')
user5 = User.create(email: 'morgamix@twitch.tv', password: 'morgamix', display_name: 'morgamix', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/21b36c5f-fcde-4e80-a359-c003b89016c6-profile_image-300x300.png', created_at: '25-05-2021')
user6 = User.create(email: 'anarlguerra@twitch.tv', password: 'anarlguerra', display_name: 'anarlguerra', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/eafce906-c626-4df9-bba6-629076a53c72-profile_image-300x300.png', created_at: '11-11-2019')
puts "Create users successfully"


puts "Creating some categories"
category1 = Category.create(name: 'Fortnite', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/33214-285x380.jpg', average_viewers: 100000, peak_viewers: 500000, peak_viewers_date: '20-07-2018')
category2 = Category.create(name: 'FIFA 23', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/1745202732_IGDB-285x380.jpg', average_viewers: 70000, peak_viewers: 350000, peak_viewers_date: '05-10-2022')
category3 = Category.create(name: 'Just Chatting', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/509658-285x380.jpg', average_viewers: 500000, peak_viewers: 800000, peak_viewers_date: '15-04-2020')
category4 = Category.create(name: 'Hogwarts Legacy', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/1095275650_IGDB-272x380.jpg', average_viewers: 100000, peak_viewers: 500000, peak_viewers_date: '15-02-2023')
category5 = Category.create(name: 'League of Legends', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/21779-285x380.jpg', average_viewers: 70000, peak_viewers: 900000, peak_viewers_date: '02-03-2019')
category6 = Category.create(name: 'Valorant', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/516575-285x380.jpg', average_viewers: 60000, peak_viewers: 600000, peak_viewers_date: '20-09-2020')
puts "Created categories successfully"

puts "Creating some streams"
#Stream 1
stream1 = Stream.create!(user: user1, category: category5, status: 'live', started_at: Date.new, language: 'cona', viewer_count: 1900, average_viewers: 170, peak_viewers: 200, number_of_chat_messages: 800, unique_chatters: 150, new_followers: 30, new_subscriptions: 5)
stream2 = Stream.create!(user: user1, category: category4, status: 'live', started_at: Time.new(2023,02,20, 16, 00, 00), language: 'portuguese', viewer_count: 2000, average_viewers: 200, peak_viewers: 250, number_of_chat_messages: 1000, unique_chatters: 200, new_followers: 20, new_subscriptions: 4)
stream3 = Stream.create!(user: user1, category: category1, status: 'live', started_at: Time.new(2023,03,05, 11, 30, 00), language: 'portuguese', viewer_count: 1000, average_viewers: 100, peak_viewers: 150, number_of_chat_messages: 500, unique_chatters: 100, new_followers: 10, new_subscriptions: 2)

# #Stream 2
stream4 = Stream.create!(user: user2, category: category2, status: 'live', started_at: Time.new(2023,03,05, 11, 30, 00), language: 'english', viewer_count: 10000, average_viewers: 1000, peak_viewers: 1500, number_of_chat_messages: 5000, unique_chatters: 1000, new_followers: 100, new_subscriptions: 20)
stream5 = Stream.create!(user: user2, category: category1, status: 'live', started_at: Time.new(2023,02,20, 16, 00, 00), language: 'english', viewer_count: 20000, average_viewers: 2000, peak_viewers: 2500, number_of_chat_messages: 10000, unique_chatters: 2000, new_followers: 200, new_subscriptions: 40)
stream6 = Stream.create!(user: user2, category: category4, status: 'live', started_at: Time.new(2023,01,30, 22, 15, 00), language: 'english', viewer_count: 19000, average_viewers: 1700, peak_viewers: 2000, number_of_chat_messages: 8000, unique_chatters: 1500, new_followers: 300, new_subscriptions: 50)
# #Stream 3
stream7 = Stream.create!(user: user3, category: category2, status: 'live', started_at: Time.new(2023,03,05, 11, 30, 00), language: 'portuguese', viewer_count: 100, average_viewers: 10, peak_viewers: 15, number_of_chat_messages: 50, unique_chatters: 10, new_followers: 1, new_subscriptions: 0)
stream8 = Stream.create!(user: user3, category: category3, status: 'live', started_at: Time.new(2023,02,20, 16, 00, 00), language: 'portuguese', viewer_count: 200, average_viewers: 20, peak_viewers: 25, number_of_chat_messages: 100, unique_chatters: 20, new_followers: 2, new_subscriptions: 1)
stream9 = Stream.create!(user: user3, category: category6, status: 'live', started_at: Time.new(2023,01,30, 22, 15, 00), language: 'portuguese', viewer_count: 190, average_viewers: 17, peak_viewers: 20, number_of_chat_messages: 80, unique_chatters: 15, new_followers: 3, new_subscriptions: 2)
# #Stream 4
stream10 = Stream.create!(user: user4, category: category1, status: 'live', started_at: Time.new(2023,03,05, 11, 30, 00), language: 'english', viewer_count: 100000, average_viewers: 10000, peak_viewers: 15000, number_of_chat_messages: 50000, unique_chatters: 10000, new_followers: 1000, new_subscriptions: 200)
stream11 = Stream.create!(user: user4, category: category2, status: 'live', started_at: Time.new(2023,02,20, 16, 00, 00), language: 'english', viewer_count: 20000, average_viewers: 20000, peak_viewers: 25000, number_of_chat_messages: 100000, unique_chatters: 20000, new_followers: 2000, new_subscriptions: 100)
stream12 = Stream.create!(user: user4, category: category3, status: 'live', started_at: Time.new(2023,01,30, 22, 15, 00), language: 'english', viewer_count: 19000, average_viewers: 17000, peak_viewers: 20000, number_of_chat_messages: 80000, unique_chatters: 15000, new_followers: 3000, new_subscriptions: 300)
# #Stream 5
stream13 = Stream.create!(user: user5, category: category6, status: 'live', started_at: Time.new(2023,03,05, 11, 30, 00), language: 'portuguese', viewer_count: 200, average_viewers: 100, peak_viewers: 150, number_of_chat_messages: 500, unique_chatters: 100, new_followers: 10, new_subscriptions: 6)
stream14 = Stream.create!(user: user5, category: category5, status: 'live', started_at: Time.new(2023,02,20, 16, 00, 00), language: 'portuguese', viewer_count: 400, average_viewers: 200, peak_viewers: 250, number_of_chat_messages: 1000, unique_chatters: 200, new_followers: 20, new_subscriptions: 8)
stream15 = Stream.create!(user: user5, category: category4, status: 'live', started_at: Time.new(2023,01,30, 22, 15, 00), language: 'portuguese', viewer_count: 390, average_viewers: 170, peak_viewers: 200, number_of_chat_messages: 800, unique_chatters: 150, new_followers: 30, new_subscriptions: 3)
# #Stream 6
stream16 = Stream.create!(user: user5, category: category3, status: 'live', started_at: Time.new(2023,03,05, 11, 30, 00), language: 'portuguese', viewer_count: 20, average_viewers: 10, peak_viewers: 15, number_of_chat_messages: 50, unique_chatters: 10, new_followers: 3, new_subscriptions: 0)
stream17 = Stream.create!(user: user5, category: category5, status: 'live', started_at: Time.new(2023,02,20, 16, 00, 00), language: 'portuguese', viewer_count: 40, average_viewers: 20, peak_viewers: 25, number_of_chat_messages: 100, unique_chatters: 20, new_followers: 2, new_subscriptions: 1)
stream18 = Stream.create!(user: user5, category: category2, status: 'live', started_at: Time.new(2023,01,30, 22, 15, 00), language: 'portuguese', viewer_count: 39, average_viewers: 17, peak_viewers: 20, number_of_chat_messages: 80, unique_chatters: 15, new_followers: 1, new_subscriptions: 2)
puts "Created streams successfully"


puts "Creating some clips"
#Stream 1
clip1 = Clip.create!(stream: stream1, title: "Clip 1", view_count: 100, clip_date: Time.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/AT-cm%7C1192997034-preview-260x147.jpg')
#Stream 4
clip2 = Clip.create!(stream: stream4, title: "Clip 2", view_count: 1000, clip_date: Time.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/FFewlUqsDHMcEcdRzNIJjg/AT-cm%7CFFewlUqsDHMcEcdRzNIJjg-preview-260x147.jpg')
#Stream 7
clip3 = Clip.create!(stream: stream7, title: "Clip 3", view_count: 10, clip_date: Time.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/5_asp8wO49oDgAF9FYzJCQ/46670899884-offset-1724-preview-260x147.jpg')
#Stream 10
clip4 = Clip.create!(stream: stream10, title: "Clip 4", view_count: 10000, clip_date: Time.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/rCpMLQ8B7n6DJ5px_esr2g/AT-cm%7CrCpMLQ8B7n6DJ5px_esr2g-preview-260x147.jpg')
#Stream 13
clip5 = Clip.create!(stream: stream13, title: "Clip 5", view_count: 200, clip_date: Time.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/XN4VDicxQTA0F79LIXk4Qw/AT-cm%7CXN4VDicxQTA0F79LIXk4Qw-preview-260x147.jpg')
#Stream 16
clip6 = Clip.create!(stream: stream16, title: "Clip 6", view_count: 20, clip_date: Time.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/_BQeWWKzN40cc-83MSzDqA/AT-cm%7C_BQeWWKzN40cc-83MSzDqA-preview-260x147.jpg')
puts "Created clips successfully"
