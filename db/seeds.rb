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
user1 = User.create(email: 'alexandre0grande@twitch.tv', password: 'alexandre', display_name: 'alexandre0grande', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/0b31cfd4-e60b-43bf-b1a1-19e4df9a02be-profile_image-300x300.png', created_at: '21-04-2020', description: 'Olá Espartano! Sê Bem-vindo à Legião do Alexandre o Grande! (canal em off por tempo indeterminado) ⚔️', total_followers: 11100)
user2 = User.create(email: 'pokimane@twitch.tv', password: 'pokimane', display_name: 'pokimane', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/6cd4de40-1a83-46c7-aea5-3bd73f90e7e4-profile_image-300x300.png', created_at: '14-02-2016', description: 'Welcome to my channel! :) I play a variety of games, chat, stream IRL & more! I love interacting with my chat & making others happy, so come say hi!', total_followers: 9300000)
user3 = User.create(email: 'soficious@twitch.tv', password: 'soficious', display_name: 'soficious', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/1ff9ccec-1f47-4b0b-9c5e-6cded0ed1dac-profile_image-300x300.png', created_at: '30-09-2021', description: 'Streamer que luta pela acessibilidade e inclusão em jogos ♿🌈 .Canal focado em RPG e SP 🧙🏻‍♀️⚔. Só preciso de três refeições: Final Fantasy 👾, Dragon Age 🐲e Mass Effect 🚀. Querem entrar em contacto? É este o e-mail 📨 ladysoficious@gmail.com', total_followers: 844)
user4 = User.create(email: 'xqc@twitch.tv', password: 'xqctwitch', display_name: 'xqc', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/xqc-profile_image-9298dca608632101-300x300.jpeg', created_at: '01-01-2015', description: 'THE BEST AT ABSOLUTELY EVERYTHING. THE JUICER. LEADER OF THE JUICERS.', total_followers: 11700000)
user5 = User.create(email: 'morgamix@twitch.tv', password: 'morgamix', display_name: 'morgamix', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/21b36c5f-fcde-4e80-a359-c003b89016c6-profile_image-300x300.png', created_at: '25-05-2021', description: 'Gamer since... Spectrum 128k... Load " " Faço parte de uma geração de primeiros exploradores do Mundo dos videojogos. Muitas histórias e Universos fantásticos já foram vividos sozinho. Este canal não é mais que uma desculpa para partilhar e estar numa comunidade que sempre senti ser parte', total_followers: 28600)
user6 = User.create(email: 'anarlguerra@twitch.tv', password: 'anarlguerra', display_name: 'anarlguerra', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/eafce906-c626-4df9-bba6-629076a53c72-profile_image-300x300.png', created_at: '11-11-2019', description: 'Hello you! O meu nome é Ana e vivo em Portugal. Partilho o que mais gosto, discuto a intersecção da tecnologia com a cultura e luto por um mundo em que as pessoas podem ser elas próprias sem desculpas. Tudo isto, enquanto vou jogando os meus jogos favoritos.', total_followers: 3900)
user7 = User.create(email: 'miguel_conde99@twitch.tv', password: 'miguelconde', display_name: 'miguel_conde99', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/b3e53bb5-2dca-47d7-a9b2-a159e708121a-profile_image-300x300.png', created_at: '10-02-2020', description: 'FIFA Verified Player 1vs1/2vs2 Player (F/A) And Fifa Streamer', total_followers: 51700)
user8 = User.create(email: 'khaheri_@twitch.tv', password: 'khaheri_', display_name: 'khaheri_', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/2f92f722-191d-4dd2-8a2d-08df3e832d36-profile_image-300x300.png', created_at: '05-05-2021', description: 'Olá Jóia , Sou a Raquel sou parceira oficial da Nintendo Portugal e sê bem-vindo ao mundo da Nintendo Switch ! Vem pertencer a esta familia super friendly , apesar de eu ser tóxica como o veneno de uma cobra os meus seguidores são lindos ! Aproveitem o chat que são melhores que eu ahahah !', total_followers: 5300)
user9 = User.create(email: 'gmhikaru@twitch.tv', password: 'gmikaru', display_name: 'GMHikaru', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/cd921fcd-53fc-4b1d-be23-0787bc36b756-profile_image-300x300.png', created_at: '10-08-2015', description: 'Grandmaster Hikaru Nakamura, 5-time United States Chess Champion', total_followers: 1700000)
user10 = User.create(email: 'bemaryjane@twitch.tv', password: 'bemaryjane', display_name: 'bemaryjane', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/3d2911d1-9bbb-449e-bf40-3aa6351a3e8d-profile_image-300x300.png', created_at: '20-06-2017', description: 'Yelloww!!! My Name is Mary Jane and this is BEMARYJANE! :D Im a girl that loves Cosplay, gaming and music. Hope you enjoy as much as i do :)', total_followers: 3200)

puts "Create users successfully"


puts "Creating some categories"
category1 = Category.create(name: 'Fortnite', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/33214-285x380.jpg', average_viewers: 100000, peak_viewers: 500000, peak_viewers_date: '20-07-2018')
category2 = Category.create(name: 'FIFA 23', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/1745202732_IGDB-285x380.jpg', average_viewers: 70000, peak_viewers: 350000, peak_viewers_date: '05-10-2022')
category3 = Category.create(name: 'Just Chatting', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/509658-285x380.jpg', average_viewers: 500000, peak_viewers: 800000, peak_viewers_date: '15-04-2020')
category4 = Category.create(name: 'Hogwarts Legacy', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/1095275650_IGDB-272x380.jpg', average_viewers: 100000, peak_viewers: 500000, peak_viewers_date: '15-02-2023')
category5 = Category.create(name: 'League of Legends', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/21779-285x380.jpg', average_viewers: 70000, peak_viewers: 900000, peak_viewers_date: '02-03-2019')
category6 = Category.create(name: 'Valorant', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/516575-285x380.jpg', average_viewers: 60000, peak_viewers: 600000, peak_viewers_date: '20-09-2020')
category7 = Category.create(name: 'Football Manager 2023', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/1047410718_IGDB-285x380.jpg', average_viewers: 1000, peak_viewers: 8000, peak_viewers_date: '06-11-2022')
category8 = Category.create(name: 'God of War Ragnarok', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/102007682_IGDB-272x380.jpg', average_viewers: 5000, peak_viewers: 500000, peak_viewers_date: '25-10-2022')
category9 = Category.create(name: 'Sports', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/518203-285x380.jpg', average_viewers: 10000, peak_viewers: 800000, peak_viewers_date: '18-12-2022')
category10 = Category.create(name: 'Music', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/26936-285x380.jpg', average_viewers: 30000, peak_viewers: 100000, peak_viewers_date: '15-08-2020')
puts "Created categories successfully"

puts "Creating some streams"
category_array = Category.all
#User 1
30.times do
  Stream.create!(
    user: user1,
    category: category_array.sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..22), 30, 00),
    language: "Portuguese",
    viewer_count: rand(1000..2000),
    average_viewers: rand(100..200),
    peak_viewers: rand(150..300),
    number_of_chat_messages: rand(500..1000),
    unique_chatters: rand(50..100),
    new_followers: rand(5..20),
    new_subscriptions: rand(1..10)
  )
end
#User 2
30.times do
  Stream.create!(
    user: user2,
    category: category_array.sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..22), 30, 00),
    language: "English",
    viewer_count: rand(10000..20000),
    average_viewers: rand(1000..2000),
    peak_viewers: rand(1500..3000),
    number_of_chat_messages: rand(5000..10000),
    unique_chatters: rand(500..1000),
    new_followers: rand(50..200),
    new_subscriptions: rand(10..100)
  )
end
#User 3
30.times do
  Stream.create!(
    user: user3,
    category: category_array.sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..22), 30, 00),
    language: "Portuguese",
    viewer_count: rand(100..200),
    average_viewers: rand(10..20),
    peak_viewers: rand(15..30),
    number_of_chat_messages: rand(50..100),
    unique_chatters: rand(5..10),
    new_followers: rand(1..5),
    new_subscriptions: rand(0..1)
  )
end
#User 4
30.times do
  Stream.create!(
    user: user4,
    category: category_array.sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..22), 30, 00),
    language: "English",
    viewer_count: rand(100000..200000),
    average_viewers: rand(10000..20000),
    peak_viewers: rand(15000..30000),
    number_of_chat_messages: rand(50000..100000),
    unique_chatters: rand(5000..10000),
    new_followers: rand(500..2000),
    new_subscriptions: rand(100..1000)
  )
end
#User 5
30.times do
  Stream.create!(
    user: user5,
    category: category_array.sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..22), 30, 00),
    language: "Portuguese",
    viewer_count: rand(2000..3000),
    average_viewers: rand(200..300),
    peak_viewers: rand(250..400),
    number_of_chat_messages: rand(800..2000),
    unique_chatters: rand(80..200),
    new_followers: rand(10..40),
    new_subscriptions: rand(2..20)
  )
end
#User 6
30.times do
  Stream.create!(
    user: user6,
    category: category_array.sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..22), 30, 00),
    language: "Portuguese",
    viewer_count: rand(100..200),
    average_viewers: rand(10..20),
    peak_viewers: rand(15..30),
    number_of_chat_messages: rand(50..100),
    unique_chatters: rand(5..10),
    new_followers: rand(1..10),
    new_subscriptions: rand(0..2)
  )
end
#User 7
30.times do
  Stream.create!(
    user: user7,
    category: category_array.sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..22), 30, 00),
    language: "Portuguese",
    viewer_count: rand(3000..6000),
    average_viewers: rand(300..600),
    peak_viewers: rand(450..700),
    number_of_chat_messages: rand(900..3000),
    unique_chatters: rand(90..200),
    new_followers: rand(10..30),
    new_subscriptions: rand(5..15)
  )
end
#User 8
30.times do
  Stream.create!(
    user: user8,
    category: category_array.sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..22), 30, 00),
    language: "Portuguese",
    viewer_count: rand(100..200),
    average_viewers: rand(15..25),
    peak_viewers: rand(20..40),
    number_of_chat_messages: rand(50..100),
    unique_chatters: rand(5..10),
    new_followers: rand(2..7),
    new_subscriptions: rand(0..3)
  )
end
#User 9
30.times do
  Stream.create!(
    user: user9,
    category: category_array.sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..22), 30, 00),
    language: "English",
    viewer_count: rand(10000..20000),
    average_viewers: rand(1000..2000),
    peak_viewers: rand(1500..3000),
    number_of_chat_messages: rand(5000..10000),
    unique_chatters: rand(500..1000),
    new_followers: rand(50..200),
    new_subscriptions: rand(10..30)
  )
end
#User 10
30.times do
  Stream.create!(
    user: user10,
    category: category_array.sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..22), 30, 00),
    language: "Portuguese",
    viewer_count: rand(1000..2000),
    average_viewers: rand(100..200),
    peak_viewers: rand(150..300),
    number_of_chat_messages: rand(500..1000),
    unique_chatters: rand(50..100),
    new_followers: rand(5..20),
    new_subscriptions: rand(0..10)
  )
end
puts "Created streams successfully"

streams_array = Stream.all
puts "Creating some clips"
clip1 = Clip.create!(stream: streams_array.sample, title: "Clip 1", view_count: 100, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/AT-cm%7C1192997034-preview-260x147.jpg')
clip2 = Clip.create!(stream: streams_array.sample, title: "Clip 2", view_count: 1000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/FFewlUqsDHMcEcdRzNIJjg/AT-cm%7CFFewlUqsDHMcEcdRzNIJjg-preview-260x147.jpg')
clip3 = Clip.create!(stream: streams_array.sample, title: "Clip 3", view_count: 10, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/5_asp8wO49oDgAF9FYzJCQ/46670899884-offset-1724-preview-260x147.jpg')
clip4 = Clip.create!(stream: streams_array.sample, title: "Clip 4", view_count: 10000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/rCpMLQ8B7n6DJ5px_esr2g/AT-cm%7CrCpMLQ8B7n6DJ5px_esr2g-preview-260x147.jpg')
clip5 = Clip.create!(stream: streams_array.sample, title: "Clip 5", view_count: 200, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/XN4VDicxQTA0F79LIXk4Qw/AT-cm%7CXN4VDicxQTA0F79LIXk4Qw-preview-260x147.jpg')
clip6 = Clip.create!(stream: streams_array.sample, title: "Clip 6", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/_BQeWWKzN40cc-83MSzDqA/AT-cm%7C_BQeWWKzN40cc-83MSzDqA-preview-260x147.jpg')
clip7 = Clip.create!(stream: streams_array.sample, title: "Clip 7", view_count: 200, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/p0RBlriKpVRpq7L_m05JZw/AT-cm%7Cp0RBlriKpVRpq7L_m05JZw-preview-260x147.jpg')
clip8 = Clip.create!(stream: streams_array.sample, title: "Clip 8", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/hh19t3kG8USmH4o9RlA6qA/AT-cm%7Chh19t3kG8USmH4o9RlA6qA-preview-260x147.jpg')
clip9 = Clip.create!(stream: streams_array.sample, title: "Clip 9", view_count: 20000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/Q-T5aVlwGRG-L94Cb0J62g/AT-cm%7CQ-T5aVlwGRG-L94Cb0J62g-preview-260x147.jpg')
clip10 = Clip.create!(stream: streams_array.sample, title: "Clip 10", view_count: 150, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/CFcYdhlRUKbIwGddPZv3Sw/46673690124-offset-13230-preview-260x147.jpg')
clip11 = Clip.create!(stream: streams_array.sample, title: "Clip 11", view_count: 100, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/AT-cm%7C1192997034-preview-260x147.jpg')
clip12 = Clip.create!(stream: streams_array.sample, title: "Clip 12", view_count: 1000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/FFewlUqsDHMcEcdRzNIJjg/AT-cm%7CFFewlUqsDHMcEcdRzNIJjg-preview-260x147.jpg')
clip13 = Clip.create!(stream: streams_array.sample, title: "Clip 13", view_count: 10, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/5_asp8wO49oDgAF9FYzJCQ/46670899884-offset-1724-preview-260x147.jpg')
clip14 = Clip.create!(stream: streams_array.sample, title: "Clip 14", view_count: 10000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/rCpMLQ8B7n6DJ5px_esr2g/AT-cm%7CrCpMLQ8B7n6DJ5px_esr2g-preview-260x147.jpg')
clip15 = Clip.create!(stream: streams_array.sample, title: "Clip 15", view_count: 200, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/XN4VDicxQTA0F79LIXk4Qw/AT-cm%7CXN4VDicxQTA0F79LIXk4Qw-preview-260x147.jpg')
clip16 = Clip.create!(stream: streams_array.sample, title: "Clip 16", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/_BQeWWKzN40cc-83MSzDqA/AT-cm%7C_BQeWWKzN40cc-83MSzDqA-preview-260x147.jpg')
clip17 = Clip.create!(stream: streams_array.sample, title: "Clip 17", view_count: 200, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/p0RBlriKpVRpq7L_m05JZw/AT-cm%7Cp0RBlriKpVRpq7L_m05JZw-preview-260x147.jpg')
clip18 = Clip.create!(stream: streams_array.sample, title: "Clip 18", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/hh19t3kG8USmH4o9RlA6qA/AT-cm%7Chh19t3kG8USmH4o9RlA6qA-preview-260x147.jpg')
clip19 = Clip.create!(stream: streams_array.sample, title: "Clip 19", view_count: 20000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/Q-T5aVlwGRG-L94Cb0J62g/AT-cm%7CQ-T5aVlwGRG-L94Cb0J62g-preview-260x147.jpg')
clip20 = Clip.create!(stream: streams_array.sample, title: "Clip 20", view_count: 150, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/CFcYdhlRUKbIwGddPZv3Sw/46673690124-offset-13230-preview-260x147.jpg')
clip21 = Clip.create!(stream: streams_array.sample, title: "Clip 21", view_count: 100, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/AT-cm%7C1192997034-preview-260x147.jpg')
clip22 = Clip.create!(stream: streams_array.sample, title: "Clip 22", view_count: 1000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/FFewlUqsDHMcEcdRzNIJjg/AT-cm%7CFFewlUqsDHMcEcdRzNIJjg-preview-260x147.jpg')
clip23 = Clip.create!(stream: streams_array.sample, title: "Clip 23", view_count: 10, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/5_asp8wO49oDgAF9FYzJCQ/46670899884-offset-1724-preview-260x147.jpg')
clip24 = Clip.create!(stream: streams_array.sample, title: "Clip 24", view_count: 10000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/rCpMLQ8B7n6DJ5px_esr2g/AT-cm%7CrCpMLQ8B7n6DJ5px_esr2g-preview-260x147.jpg')
clip25 = Clip.create!(stream: streams_array.sample, title: "Clip 25", view_count: 200, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/XN4VDicxQTA0F79LIXk4Qw/AT-cm%7CXN4VDicxQTA0F79LIXk4Qw-preview-260x147.jpg')
clip26 = Clip.create!(stream: streams_array.sample, title: "Clip 26", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/_BQeWWKzN40cc-83MSzDqA/AT-cm%7C_BQeWWKzN40cc-83MSzDqA-preview-260x147.jpg')
clip27 = Clip.create!(stream: streams_array.sample, title: "Clip 27", view_count: 200, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/p0RBlriKpVRpq7L_m05JZw/AT-cm%7Cp0RBlriKpVRpq7L_m05JZw-preview-260x147.jpg')
clip28 = Clip.create!(stream: streams_array.sample, title: "Clip 28", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/hh19t3kG8USmH4o9RlA6qA/AT-cm%7Chh19t3kG8USmH4o9RlA6qA-preview-260x147.jpg')
clip29 = Clip.create!(stream: streams_array.sample, title: "Clip 29", view_count: 20000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/Q-T5aVlwGRG-L94Cb0J62g/AT-cm%7CQ-T5aVlwGRG-L94Cb0J62g-preview-260x147.jpg')
clip30 = Clip.create!(stream: streams_array.sample, title: "Clip 30", view_count: 150, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/CFcYdhlRUKbIwGddPZv3Sw/46673690124-offset-13230-preview-260x147.jpg')
clip31 = Clip.create!(stream: streams_array.sample, title: "Clip 31", view_count: 100, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/AT-cm%7C1192997034-preview-260x147.jpg')
clip32 = Clip.create!(stream: streams_array.sample, title: "Clip 32", view_count: 1000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/FFewlUqsDHMcEcdRzNIJjg/AT-cm%7CFFewlUqsDHMcEcdRzNIJjg-preview-260x147.jpg')
clip33 = Clip.create!(stream: streams_array.sample, title: "Clip 33", view_count: 10, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/5_asp8wO49oDgAF9FYzJCQ/46670899884-offset-1724-preview-260x147.jpg')
clip34 = Clip.create!(stream: streams_array.sample, title: "Clip 34", view_count: 10000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/rCpMLQ8B7n6DJ5px_esr2g/AT-cm%7CrCpMLQ8B7n6DJ5px_esr2g-preview-260x147.jpg')
clip35 = Clip.create!(stream: streams_array.sample, title: "Clip 35", view_count: 200, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/XN4VDicxQTA0F79LIXk4Qw/AT-cm%7CXN4VDicxQTA0F79LIXk4Qw-preview-260x147.jpg')
clip36 = Clip.create!(stream: streams_array.sample, title: "Clip 36", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/_BQeWWKzN40cc-83MSzDqA/AT-cm%7C_BQeWWKzN40cc-83MSzDqA-preview-260x147.jpg')
clip37 = Clip.create!(stream: streams_array.sample, title: "Clip 37", view_count: 200, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/p0RBlriKpVRpq7L_m05JZw/AT-cm%7Cp0RBlriKpVRpq7L_m05JZw-preview-260x147.jpg')
clip38 = Clip.create!(stream: streams_array.sample, title: "Clip 38", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/hh19t3kG8USmH4o9RlA6qA/AT-cm%7Chh19t3kG8USmH4o9RlA6qA-preview-260x147.jpg')
clip39 = Clip.create!(stream: streams_array.sample, title: "Clip 39", view_count: 20000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/Q-T5aVlwGRG-L94Cb0J62g/AT-cm%7CQ-T5aVlwGRG-L94Cb0J62g-preview-260x147.jpg')
clip40 = Clip.create!(stream: streams_array.sample, title: "Clip 40", view_count: 150, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://clips-media-assets2.twitch.tv/CFcYdhlRUKbIwGddPZv3Sw/46673690124-offset-13230-preview-260x147.jpg')
puts "Created clips successfully"
