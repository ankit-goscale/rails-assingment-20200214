arr = []

(0...5).each do |i|
  user = User.create({ email: "user#{i+1}@example.com", password: '12345678', first_name: "#{i+1}",  last_name: 'user' })
  arr << user
end

arr.each do |user|
  (0...5).each do |i|
    user.own_tweets.create({ description: "dummy tweet #{i+1} from #{ user.full_name } user." })
  end
end

arr.each do |follower|
  arr.each do |following|
    unless following.id == follower.id
      Follow.create({ follower_id: follower.id, following_id: following.id })
    end
  end
end
