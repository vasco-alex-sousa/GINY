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
user11 = User.create(email: 'kingsleague@twitch.tv', password: 'kingsleague', display_name: 'kingsleague', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/cc310a6e-8cee-435b-af4c-5b480b791037-profile_image-300x300.png', created_at: '15-08-2021', description: 'Kings League InfoJobs I La liga de los reyes.', total_followers: 2200000)
user12 = User.create(email: 'badgerxxv@twitch.tv', password: 'badger', display_name: 'badgerxxv', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/f73e014a-e7d1-43b3-b292-54cb0f4280d5-profile_image-300x300.png', created_at: '30-12-2016', description: 'Sejam bem vindos à minha stream. Eu sou o Badger um Variant Streamer que joga um pouco de tudo com o foco nos jogos Single Player, mas também jogo FPS, RPG e MMO. Não vais aprender nada de novo aqui, mas posso garantir que vais passar um bom tempo comigo e com o chat!', total_followers: 1300)
user13 = User.create(email: 'sandrolazaro@twitch.tv', password: 'sandrolazaro', display_name: 'SandroLazaro', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/e4fece27-e607-485e-b626-7c9025155705-profile_image-300x300.png', created_at: '17-11-2016', description: 'Boas, o meu nome é Sandro Lázaro tenho 29 anos e sou natural de Águeda. O jogo principal deste canal é Football Manager.Espero que gostem e sigam o canal :) Divirtam se !!', total_followers: 1700)
user14 = User.create(email: 'jogasimples@twitch.tv', password: 'jogasimples', display_name: 'JogaSimples', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/4dcff40d-155e-445e-8702-eb9e5961dc99-profile_image-300x300.png', created_at: '25-10-2017', description: 'Treinador de Futebol, apaixonado pelo jogo, mas pretende também se divertir com videojogos neste espaço virtual.', total_followers: 44800)
user15 = User.create(email: 'casimito@twitch.tv', password: 'casimito', display_name: 'casimito', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/32805a78-d927-48bd-8089-bf5efed53ea4-profile_image-300x300.png', created_at: '03-09-2018', description: 'Espero que se divirta!', total_followers: 3500000)
user16 = User.create(email: 'ricardinho10futsal@twitch.tv', password: 'ricardinho', display_name: 'Ricardinho10futsal', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/bd3d347f-0152-48be-968b-1f254d78bcd4-profile_image-300x300.png', created_at: '25-02-2019', description: 'Sou um amante do desporto -sou super competitivo e acima de tudo com uma vontade constante de aprendizagem!', total_followers: 27800)
user17 = User.create(email: 'xanajogatudo@twitch.tv', password: 'xanajogatudo', display_name: 'XanaJogaTudoo', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/cc1c854e-0296-4cfc-81c7-50ec956a15e3-profile_image-300x300.jpeg', created_at: '31-03-2021', description: 'Os jogos variam a boa disposição é que não.', total_followers: 2000)
user18 = User.create(email: 'jarnoopmeer@twitch.tv', password: 'jarnoopmeer', display_name: 'jarnoopmeer', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/add0353a-e399-4412-b76c-c2dd88dc267f-profile_image-300x300.png', created_at: '17-11-2016', description: '2020 & 2021 F1 Esports Champion driving for Mercedes AMG PETRONAS', total_followers: 246400)
user19 = User.create(email: 'radweasel@twitch.tv', password: 'radweasel', display_name: 'RadWeasel', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/82ee791d-7556-4257-b5ee-f5683510006f-profile_image-300x300.png', created_at: '17-11-2016', description: 'Embaixador NEXT LEVEL RACING - Junta-te ao Boogity Club 🏁Lets Go Racing 🚥Business contact - theradweasel@gmail.com', total_followers: 39400)
user20 = User.create(email: 'nasa@twitch.tv', password: 'nasa', display_name: 'Nasa', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/nasa-profile_image-739106d9e1948b76-300x300.png', created_at: '30-03-2017', description: 'Explore the universe and discover our home planet with the official NASA channel on Twitch.', total_followers: 1200000)
user21 = User.create(email: 'macedotv@twitch.tv', password: 'macedotv', display_name: 'Macedo_TV', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/8492a3c0-2c4d-480d-af0d-fbdff45d4d3c-profile_image-300x300.png', created_at: '24-01-2019', description: 'Email Profissional : macedo_tv_contaprofissional@hotmail.com', total_followers: 1800)
user22 = User.create(email: 'theportuguesenerdydad@twitch.tv', password: 'nerdydad', display_name: 'ThePortugueseNerdyDad', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/18475e70-594f-4cad-afe5-71c79e3d92a0-profile_image-300x300.png', created_at: '17-11-2016', description: 'Gostas de jogos indie? Roguelike? Metroidvania? Good vibes? Estás no sítio certo...', total_followers: 2000)
user23 = User.create(email: 'impakt@twitch.tv', password: 'impakt', display_name: 'impakt', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/10c11ec1-7fc4-410d-b149-cb206dbaa06d-profile_image-300x300.png', created_at: '17-11-2016', description: '1º Parceiro da Twitch em 🇵🇹 , Gamer, Streamer, Entertainer / IMPAKTTV.PT', total_followers: 149800)
user24 = User.create(email: 'sor13@twitch.tv', password: 'sor13', display_name: 'Sor13', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/bf4a86ab-f5fc-42a3-a5e4-c527752eadcc-profile_image-300x300.jpg', created_at: '17-11-2016', description: 'Bem-vindo eu sou o Sorte. Stream focada em jogos de Sobrevivência e Pro Cycling Manager.', total_followers: 534)
user25 = User.create(email: 'nelsonds16@twitch.tv', password: 'nelsonds16', display_name: 'NelsonDS16', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/ab9055c9-5a6f-4b2e-a850-13e256ee6227-profile_image-300x300.png', created_at: '19-11-2018', description: 'Boas pessoal o meu nome é Nelson tenho 27 anos, sou licenciado em Treino Desportivo e adoro jogar. Aqui jogamos essencialmente Football Manager mas também podemos estar noutro tipo de jogos, conversamos sobre vários temas mas em especial sobre Desporto. Email de Contacto: ds16nelson@gmail.com', total_followers: 3800)
user26 = User.create(email: 'mafskiwi@twitch.tv', password: 'mafskiwi', display_name: 'MafsKiwi', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/64925138-97bd-448c-b076-e3f795ebfc2f-profile_image-300x300.png', created_at: '01-10-2021', description: 'Hii guys! My name is Mafalda, Im from Portugal and I enjoy streaming. My channel focuses on gaming, I mainly play valorant but i like trying new games! Hope you enjoy and have fun with me 🥰', total_followers: 2300)
user27 = User.create(email: 'ptanimestreams@twitch.tv', password: 'ptanime', display_name: 'ptAnimeStreams', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/03f70562-7555-433a-9369-00027988cc1d-profile_image-300x300.png', created_at: '03-11-2020', description: 'Bem vindos ao canal da Twitch do ptAnime! Aqui iremos trazer conteúdo relacionado com cultura asiática e quem sabe mais! Não se esqueçam de nos acompanhar no nosso site, onde vos trazemos análises, entrevistas e as novidades mais recentes do mundo anime, manga, videojogos, k-pop, e mais.', total_followers: 468)
user28 = User.create(email: 'kindafunnygames@twitch.tv', password: 'kindafunny', display_name: 'KindaFunnyGames', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/a7b8ceee-5252-4f73-ab38-5a02f23bd14b-profile_image-300x300.png', created_at: '17-11-2016', description: 'M-F 10am PT - Kinda Funny Games Daily, 11am PT (ish) - Game streams! Keep an eye on twitter.com/kindafunnyvids for details! ⬞ Team Kinda Funny ⬞ Greg, Nick, Tim, Kevin, Bless, Andy, Joey, Mike, Barrett, Roger, & Cool Greg', total_followers: 171100)
user29 = User.create(email: 'xip4twitch@twitch.tv', password: 'xip4_twitch', display_name: 'xip4_twitch', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/84dac606-5b27-48d8-becf-97116a6967d0-profile_image-300x300.png', created_at: '19-07-2018', description: '👩Metade Humana🎮 Metade Geek🎇Quem disse Netflix and chill não conhece Anime, K-pop e jogos de terror 💜Business requests: xipaxups@gmail.com', total_followers: 1700)
user30 = User.create(email: '2kcaioteixeira@twitch.tv', password: '2kcaio', display_name: '2KCaioTeixeira', profile_image_url: 'https://static-cdn.jtvnw.net/jtv_user_pictures/1d6dd3a0-900d-4d7c-8851-e9c2607d9149-profile_image-300x300.png', created_at: '21-10-2010', description: '2KCaioTeixeira transmite NBA 2K23.', total_followers: 69100)
puts "Create users successfully"

puts "Creating some categories"
category1 = Category.create(name: 'Fortnite', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/33214-285x380.jpg', average_viewers: 14800, peak_viewers: 700500, peak_viewers_date: '13-06-2018')
category2 = Category.create(name: 'FIFA 23', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/1745202732_IGDB-285x380.jpg', average_viewers: 26605, peak_viewers: 485800, peak_viewers_date: '26-09-2022')
category3 = Category.create(name: 'Just Chatting', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/509658-285x380.jpg', average_viewers: 359400, peak_viewers: 2870000, peak_viewers_date: '11-01-2021')
category4 = Category.create(name: 'Hogwarts Legacy', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/1095275650_IGDB-272x380.jpg', average_viewers: 5874, peak_viewers: 1250000, peak_viewers_date: '07-02-2023')
category5 = Category.create(name: 'League of Legends', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/21779-285x380.jpg', average_viewers: 164000, peak_viewers: 3100000, peak_viewers_date: '06-11-2022')
category6 = Category.create(name: 'Valorant', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/516575-285x380.jpg', average_viewers: 122300, peak_viewers: 1700000, peak_viewers_date: '07-04-2020')
category7 = Category.create(name: 'Football Manager 2023', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/1047410718_IGDB-285x380.jpg', average_viewers: 1700, peak_viewers: 27000, peak_viewers_date: '20-11-2022')
category8 = Category.create(name: 'God of War Ragnarok', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/102007682_IGDB-272x380.jpg', average_viewers: 400, peak_viewers: 470000, peak_viewers_date: '09-11-2022')
category9 = Category.create(name: 'Sports', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/518203-285x380.jpg', average_viewers: 27400, peak_viewers: 1500000, peak_viewers_date: '26-05-2021')
category10 = Category.create(name: 'Resident Evil 4', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/322503446_IGDB-272x380.jpg', average_viewers: 7300, peak_viewers: 89800, peak_viewers_date: '09-03-2023')
category11 = Category.create(name: 'Pro Cycling Manager 2022', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/1553050340_IGDB-272x380.jpg', average_viewers: 131, peak_viewers: 1700, peak_viewers_date: '28-06-2022')
category12 = Category.create(name: 'NBA 2K23', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/772421245_IGDB-285x380.jpg', average_viewers: 4400, peak_viewers: 351700, peak_viewers_date: '09-09-2022')
category13 = Category.create(name: 'F1 22', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/1705795372_IGDB-285x380.jpg', average_viewers: 1300, peak_viewers: 112000, peak_viewers_date: '04-11-2022')
category14 = Category.create(name: 'F1 Manager 2022', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/489490035_IGDB-285x380.jpg', average_viewers: 107, peak_viewers: 63400, peak_viewers_date: '25-08-2022')
category15 = Category.create(name: 'Pokemon Unite', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/518379_IGDB-272x380.jpg', average_viewers: 1290, peak_viewers: 225400, peak_viewers_date: '21-07-2021')
category16 = Category.create(name: 'Chess', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/743-285x380.jpg', average_viewers: 9800, peak_viewers: 370100, peak_viewers_date: '15-02-2021')
category17 = Category.create(name: 'Talk Shows & Podcasts', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/417752-285x380.jpg', average_viewers: 6000, peak_viewers: 413700, peak_viewers_date: '30-05-2020')
category18 = Category.create(name: 'Final Fantasy VII Remake', box_art_url: 'https://static-cdn.jtvnw.net/ttv-boxart/490359_IGDB-272x380.jpg', average_viewers: 109, peak_viewers: 227800, peak_viewers_date: '10-04-2020')
puts "Created categories successfully"

puts "Creating some streams"
category_array = Category.all
#User 1
60.times do
  Stream.create!(
    user: user1,
    category: [category7, category9, category11, category12, category14].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(1000..2000),
    average_viewers: rand(100..200),
    peak_viewers: rand(201..300),
    number_of_chat_messages: rand(500..1000),
    unique_chatters: rand(50..100),
    new_followers: rand(5..20),
    new_subscriptions: rand(1..5)
  )
end
#User 2
60.times do
  Stream.create!(
    user: user2,
    category: [category1, category3, category5, category6].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "English",
    viewer_count: rand(100000..200000),
    average_viewers: rand(10000..15000),
    peak_viewers: rand(16000..19000),
    number_of_chat_messages: rand(50000..80000),
    unique_chatters: rand(5000..8000),
    new_followers: rand(500..800),
    new_subscriptions: rand(100..200)
  )
end
#User 3
60.times do
  Stream.create!(
    user: user3,
    category: [category3, category8, category10, category18].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(100..200),
    average_viewers: rand(15..25),
    peak_viewers: rand(30..50),
    number_of_chat_messages: rand(50..100),
    unique_chatters: rand(10..20),
    new_followers: rand(1..5),
    new_subscriptions: rand(0..2)
  )
end
#User 4
60.times do
  Stream.create!(
    user: user4,
    category: [category3, category4, category5, category6].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "English",
    viewer_count: rand(100000..200000),
    average_viewers: rand(50000..80000),
    peak_viewers: rand(90000..100000),
    number_of_chat_messages: rand(80000..100000),
    unique_chatters: rand(6000..10000),
    new_followers: rand(600..1000),
    new_subscriptions: rand(200..300)
  )
end
#User 5
60.times do
  Stream.create!(
    user: user5,
    category: [category3, category4, category8, category10].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(2000..3000),
    average_viewers: rand(150..250),
    peak_viewers: rand(300..400),
    number_of_chat_messages: rand(1000..2000),
    unique_chatters: rand(100..200),
    new_followers: rand(10..30),
    new_subscriptions: rand(3..10)
  )
end
#User 6
60.times do
  Stream.create!(
    user: user6,
    category: [category3, category8, category10, category18].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(100..200),
    average_viewers: rand(17..30),
    peak_viewers: rand(40..55),
    number_of_chat_messages: rand(100..300),
    unique_chatters: rand(15..30),
    new_followers: rand(3..10),
    new_subscriptions: rand(1..3)
  )
end
#User 7
60.times do
  Stream.create!(
    user: user7,
    category: [category2, category3, category9].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(3000..6000),
    average_viewers: rand(150..400),
    peak_viewers: rand(500..700),
    number_of_chat_messages: rand(900..2000),
    unique_chatters: rand(100..300),
    new_followers: rand(15..40),
    new_subscriptions: rand(4..16)
  )
end
#User 8
60.times do
  Stream.create!(
    user: user8,
    category: [category3, category4, category6, category15].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(100..200),
    average_viewers: rand(15..20),
    peak_viewers: rand(25..35),
    number_of_chat_messages: rand(100..300),
    unique_chatters: rand(15..25),
    new_followers: rand(3..9),
    new_subscriptions: rand(0..3)
  )
end
#User 9
60.times do
  Stream.create!(
    user: user9,
    category: [category3, category16, category17].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "English",
    viewer_count: rand(100000..200000),
    average_viewers: rand(13000..20000),
    peak_viewers: rand(25000..30000),
    number_of_chat_messages: rand(10000..30000),
    unique_chatters: rand(2000..4000),
    new_followers: rand(100..300),
    new_subscriptions: rand(30..50)
  )
end
#User 10
60.times do
  Stream.create!(
    user: user10,
    category: [category3, category5, category6, category10].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(1000..2000),
    average_viewers: rand(100..200),
    peak_viewers: rand(150..300),
    number_of_chat_messages: rand(500..1000),
    unique_chatters: rand(50..100),
    new_followers: rand(10..20),
    new_subscriptions: rand(2..6)
  )
end
#User 11
60.times do
  Stream.create!(
    user: user11,
    category: [category2, category3, category9, category17].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Spanish",
    viewer_count: rand(1000000..2000000),
    average_viewers: rand(150000..180000),
    peak_viewers: rand(200000..250000),
    number_of_chat_messages: rand(200000..300000),
    unique_chatters: rand(150000..200000),
    new_followers: rand(1000..2000),
    new_subscriptions: rand(100..300)
  )
end
#User 12
60.times do
  Stream.create!(
    user: user12,
    category: [category4, category8, category10, category18].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(100..200),
    average_viewers: rand(10..15),
    peak_viewers: rand(20..25),
    number_of_chat_messages: rand(30..60),
    unique_chatters: rand(10..20),
    new_followers: rand(1..2),
    new_subscriptions: rand(0..1)
  )
end
#User 13
60.times do
  Stream.create!(
    user: user13,
    category: [category2, category7, category13, category14].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(250..400),
    average_viewers: rand(17..25),
    peak_viewers: rand(30..45),
    number_of_chat_messages: rand(100..200),
    unique_chatters: rand(15..25),
    new_followers: rand(3..6),
    new_subscriptions: rand(0..2)
  )
end
#User 14
60.times do
  Stream.create!(
    user: user14,
    category: [category2, category3, category9, category17].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(4000..6000),
    average_viewers: rand(400..600),
    peak_viewers: rand(700..900),
    number_of_chat_messages: rand(2000..3000),
    unique_chatters: rand(300..500),
    new_followers: rand(10..30),
    new_subscriptions: rand(3..9)
  )
end
#User 15
60.times do
  Stream.create!(
    user: user15,
    category: [category2, category3, category9, category16].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(100000..300000),
    average_viewers: rand(15000..25000),
    peak_viewers: rand(30000..40000),
    number_of_chat_messages: rand(100000..200000),
    unique_chatters: rand(1000..3000),
    new_followers: rand(200..400),
    new_subscriptions: rand(50..100)
  )
end
#User 16
60.times do
  Stream.create!(
    user: user16,
    category: [category3, category9, category17].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(1000..2000),
    average_viewers: rand(150..250),
    peak_viewers: rand(300..400),
    number_of_chat_messages: rand(1000..2000),
    unique_chatters: rand(100..300),
    new_followers: rand(15..25),
    new_subscriptions: rand(2..5)
  )
end
#User 17
60.times do
  Stream.create!(
    user: user17,
    category: [category4, category8, category10, category15, category18].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(300..600),
    average_viewers: rand(20..30),
    peak_viewers: rand(40..50),
    number_of_chat_messages: rand(100..200),
    unique_chatters: rand(15..25),
    new_followers: rand(1..5),
    new_subscriptions: rand(0..1)
  )
end
#User 18
60.times do
  Stream.create!(
    user: user18,
    category: [category2, category12, category13, category14].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "English",
    viewer_count: rand(20000..30000),
    average_viewers: rand(1000..1500),
    peak_viewers: rand(2000..2500),
    number_of_chat_messages: rand(6000..9000),
    unique_chatters: rand(500..1000),
    new_followers: rand(40..80),
    new_subscriptions: rand(5..25)
  )
end
#User 19
60.times do
  Stream.create!(
    user: user19,
    category: [category2, category12, category13, category14].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(20000..30000),
    average_viewers: rand(170..230),
    peak_viewers: rand(250..300),
    number_of_chat_messages: rand(1500..2000),
    unique_chatters: rand(150..200),
    new_followers: rand(15..25),
    new_subscriptions: rand(3..6)
  )
end
# #User 20
# 30.times do
#   Stream.create!(
#     user: user20,
#     category: [category3, category17].sample,
#     status: "live",
#     started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
#     language: "English",
#     viewer_count: rand(60000..90000),
#     average_viewers: rand(4000..5000),
#     peak_viewers: rand(6000..8000),
#     number_of_chat_messages: rand(15000..20000),
#     unique_chatters: rand(1500..2000),
#     new_followers: rand(150..300),
#     new_subscriptions: rand(10..20)
#   )
# end
#User 21
60.times do
  Stream.create!(
    user: user21,
    category: [category7, category11, category12, category14].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(500..700),
    average_viewers: rand(30..40),
    peak_viewers: rand(50..60),
    number_of_chat_messages: rand(400..800),
    unique_chatters: rand(30..50),
    new_followers: rand(3..6),
    new_subscriptions: rand(1..2)
  )
end
#User 22
60.times do
  Stream.create!(
    user: user22,
    category: [category4, category8, category10, category18].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(250..500),
    average_viewers: rand(13..20),
    peak_viewers: rand(25..30),
    number_of_chat_messages: rand(100..200),
    unique_chatters: rand(15..25),
    new_followers: rand(1..3),
    new_subscriptions: rand(0..1)
  )
end
#User 23
60.times do
  Stream.create!(
    user: user23,
    category: [category4, category8, category10, category16, category18].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(25000..50000),
    average_viewers: rand(700..800),
    peak_viewers: rand(1000..1200),
    number_of_chat_messages: rand(5000..9000),
    unique_chatters: rand(500..600),
    new_followers: rand(20..40),
    new_subscriptions: rand(10..20)
  )
end
# #User 24
# 30.times do
#   Stream.create!(
#     user: user24,
#     category: [category7, category11, category12, category14].sample,
#     status: "live",
#     started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
#     language: "Portuguese",
#     viewer_count: rand(100..200),
#     average_viewers: rand(8..10),
#     peak_viewers: rand(12..16),
#     number_of_chat_messages: rand(20..40),
#     unique_chatters: rand(5..10),
#     new_followers: rand(1..3),
#     new_subscriptions: rand(0..1)
#   )
# end
#User 25
60.times do
  Stream.create!(
    user: user25,
    category: [category2, category6, category7, category9].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(600..900),
    average_viewers: rand(30..40),
    peak_viewers: rand(50..60),
    number_of_chat_messages: rand(300..600),
    unique_chatters: rand(25..50),
    new_followers: rand(2..6),
    new_subscriptions: rand(1..2)
  )
end
#User 26
60.times do
  Stream.create!(
    user: user26,
    category: [category1, category5, category6, category15].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(600..900),
    average_viewers: rand(30..35),
    peak_viewers: rand(45..55),
    number_of_chat_messages: rand(200..500),
    unique_chatters: rand(20..40),
    new_followers: rand(2..5),
    new_subscriptions: rand(1..3)
  )
end
#User 27
60.times do
  Stream.create!(
    user: user27,
    category: [category1, category5, category6, category10, category15, category17].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(100..200),
    average_viewers: rand(7..10),
    peak_viewers: rand(12..15),
    number_of_chat_messages: rand(50..70),
    unique_chatters: rand(5..10),
    new_followers: rand(1..2),
    new_subscriptions: rand(0..1)
  )
end
#User 28
60.times do
  Stream.create!(
    user: user28,
    category: [category1, category4, category8, category10, category16, category17, category18].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "English",
    viewer_count: rand(2500..5000),
    average_viewers: rand(500..700),
    peak_viewers: rand(800..900),
    number_of_chat_messages: rand(2000..4000),
    unique_chatters: rand(400..600),
    new_followers: rand(25..50),
    new_subscriptions: rand(20..40)
  )
end
#User 29
60.times do
  Stream.create!(
    user: user29,
    category: [category1, category4, category5, category6, category10, category15].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(300..600),
    average_viewers: rand(20..25),
    peak_viewers: rand(30..35),
    number_of_chat_messages: rand(100..300),
    unique_chatters: rand(15..25),
    new_followers: rand(2..5),
    new_subscriptions: rand(1..2)
  )
end
#User 30
60.times do
  Stream.create!(
    user: user30,
    category: [category2, category9, category12, category13, category14].sample,
    status: "live",
    started_at: DateTime.new(2023, rand(1..3), rand(1..10), rand(10..16), 30, 00),
    language: "Portuguese",
    viewer_count: rand(4000..8000),
    average_viewers: rand(650..750),
    peak_viewers: rand(800..900),
    number_of_chat_messages: rand(2000..4000),
    unique_chatters: rand(400..600),
    new_followers: rand(20..40),
    new_subscriptions: rand(5..15)
  )
end
puts "Created streams successfully"

streams_array = Stream.all
puts "Creating some clips"
#User 1
clip1 = Clip.create!(stream: user1.streams.sample, title: "GG", view_count: 100, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/BrYQ6Y.gif')
clip2 = Clip.create!(stream: user2.streams.sample, title: "F in the chat", view_count: 1000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/nR98zW.gif')
clip3 = Clip.create!(stream: user3.streams.sample, title: "Poggers", view_count: 10, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/mq9GE9.gif')
clip4 = Clip.create!(stream: user4.streams.sample, title: "Take that L", view_count: 10000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/pZj7zp.gif')
clip5 = Clip.create!(stream: user5.streams.sample, title: "Huge W", view_count: 200, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/BrYQnk.gif')
clip6 = Clip.create!(stream: user6.streams.sample, title: "Noob Moment", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/r2lXY4.gif')
clip7 = Clip.create!(stream: user7.streams.sample, title: "WTF", view_count: 200, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/x6r9l3.gif')
clip8 = Clip.create!(stream: user8.streams.sample, title: "Get Good", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/z6w9nZ.gif')
clip9 = Clip.create!(stream: user9.streams.sample, title: "KEKW", view_count: 20000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/EqVGPY.gif')
clip10 = Clip.create!(stream: user10.streams.sample, title: "LUL", view_count: 150, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/J89lPJ.gif')
clip11 = Clip.create!(stream: user1.streams.sample, title: "OMG!", view_count: 200, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/Og0qEY.gif')
clip12 = Clip.create!(stream: user2.streams.sample, title: "Simp Alert", view_count: 2000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/Qk8vN0.gif')
clip13 = Clip.create!(stream: user3.streams.sample, title: "Need Help", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/RlVwMO.gif')
clip14 = Clip.create!(stream: user4.streams.sample, title: "Pro Player", view_count: 20000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/VvVl5v.gif')
clip15 = Clip.create!(stream: user5.streams.sample, title: "Rare W", view_count: 400, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/WP9mwQ.gif')
clip16 = Clip.create!(stream: user6.streams.sample, title: "Another L", view_count: 40, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/XQ9n75.gif')
clip17 = Clip.create!(stream: user7.streams.sample, title: "Rage Moment", view_count: 400, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/x6r9l3.gif')
clip18 = Clip.create!(stream: user8.streams.sample, title: "Ok Boomer", view_count: 40, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/Y790QM.gif')
clip19 = Clip.create!(stream: user9.streams.sample, title: "Best Streamer", view_count: 40000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/Z89pww.gif')
clip20 = Clip.create!(stream: user10.streams.sample, title: "Nice", view_count: 250, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/16vQYV.gif')
# clip21 = Clip.create!(stream: streams_array.sample, title: "Clip 21", view_count: 150, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/BrYQ6Y.gif')
# clip22 = Clip.create!(stream: streams_array.sample, title: "Clip 22", view_count: 1500, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/nR98zW.gif')
# clip23 = Clip.create!(stream: streams_array.sample, title: "Clip 23", view_count: 15, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/mq9GE9.gif')
# clip24 = Clip.create!(stream: streams_array.sample, title: "Clip 24", view_count: 15000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/pZj7zp.gif')
# clip25 = Clip.create!(stream: streams_array.sample, title: "Clip 25", view_count: 250, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/BrYQnk.gif')
# clip26 = Clip.create!(stream: streams_array.sample, title: "Clip 26", view_count: 25, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/r2lXY4.gif')
# clip27 = Clip.create!(stream: streams_array.sample, title: "Clip 27", view_count: 250, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/x6r9l3.gif')
# clip28 = Clip.create!(stream: streams_array.sample, title: "Clip 28", view_count: 25, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/z6w9nZ.gif')
# clip29 = Clip.create!(stream: streams_array.sample, title: "Clip 29", view_count: 25000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/EqVGPY.gif')
# clip30 = Clip.create!(stream: streams_array.sample, title: "Clip 30", view_count: 200, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/J89lPJ.gif')
# clip31 = Clip.create!(stream: streams_array.sample, title: "Clip 31", view_count: 250, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/Og0qEY.gif')
# clip32 = Clip.create!(stream: streams_array.sample, title: "Clip 32", view_count: 2500, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/Qk8vN0.gif')
# clip33 = Clip.create!(stream: streams_array.sample, title: "Clip 33", view_count: 25, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/RlVwMO.gif')
# clip34 = Clip.create!(stream: streams_array.sample, title: "Clip 34", view_count: 25000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/VvVl5v.gif')
# clip35 = Clip.create!(stream: streams_array.sample, title: "Clip 35", view_count: 450, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/WP9mwQ.gif')
# clip36 = Clip.create!(stream: streams_array.sample, title: "Clip 36", view_count: 45, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/XQ9n75.gif')
# clip37 = Clip.create!(stream: streams_array.sample, title: "Clip 37", view_count: 450, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/x6r9l3.gif')
# clip38 = Clip.create!(stream: streams_array.sample, title: "Clip 38", view_count: 45, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/Y790QM.gif')
# clip39 = Clip.create!(stream: streams_array.sample, title: "Clip 39", view_count: 45000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/Z89pww.gif')
# clip40 = Clip.create!(stream: streams_array.sample, title: "Clip 40", view_count: 255, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/16vQYV.gif')
# clip41 = Clip.create!(stream: streams_array.sample, title: "Clip 41", view_count: 10, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/BrYQ6Y.gif')
# clip42 = Clip.create!(stream: streams_array.sample, title: "Clip 42", view_count: 100, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/nR98zW.gif')
# clip43 = Clip.create!(stream: streams_array.sample, title: "Clip 43", view_count: 1, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/mq9GE9.gif')
# clip44 = Clip.create!(stream: streams_array.sample, title: "Clip 44", view_count: 1000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/pZj7zp.gif')
# clip45 = Clip.create!(stream: streams_array.sample, title: "Clip 45", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/BrYQnk.gif')
# clip46 = Clip.create!(stream: streams_array.sample, title: "Clip 46", view_count: 2, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/r2lXY4.gif')
# clip47 = Clip.create!(stream: streams_array.sample, title: "Clip 47", view_count: 3, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/x6r9l3.gif')
# clip48 = Clip.create!(stream: streams_array.sample, title: "Clip 48", view_count: 20, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/z6w9nZ.gif')
# clip49 = Clip.create!(stream: streams_array.sample, title: "Clip 49", view_count: 2000, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/EqVGPY.gif')
# clip50 = Clip.create!(stream: streams_array.sample, title: "Clip 50", view_count: 15, clip_date: DateTime.new(2023,03,05, 12,00, 00), thumbnail_url: 'https://j.gifs.com/J89lPJ.gif')

puts "Created clips successfully"
