5.times do |n|
User.create!(
  name:"施設おたく#{n+1}",
  email:"test#{n+1}@test.com",
  image: File.open('./app/assets/images2/men1.jpg'),
  password:"123456"
  )
end
User.all.each do |user|
  user.facilities.create!(
    title:'testfacility',
    content:'とてもいいところ',
    prefecture:'国分寺',
    address:'本町',
    image:File.open('./app/assets/images/download.jpg'),
    types:'屋外'
    )
end
