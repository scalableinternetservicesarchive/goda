Driver.delete_all
Hitcher.delete_all
User.delete_all
place1 = ["Santa Barbara, CA, United States", "Los Angeles, CA, United States","San Diego, CA, United States","San Francisco, CA, United States"]
place2 = ["Arizona, United States", "Utah, United States", "Illinois, United States","San Antonio, TX,  United States"]
username = "user"
pwd = "111111"
salt = BCrypt::Engine.generate_salt
password = BCrypt::Engine.hash_secret(pwd, salt)
drivername = "driver"
usernames = Array.new(200000){ |i| "user" + (i+1).to_s }
user  = User.create!(
  name: "postuser",
        email: "postemail@example.com",
  password: "111111",
        password_confirmation: "111111"
  )

ActiveRecord::Base.transaction do
start_time = Time.now
  
  for i in 1..200000 do
    inserts = []
    inserts << "('#{usernames[i]}', '#{usernames[i]}@example.com', '#{password}', '#{Date.today}', '#{Date.today}')"
  
  sql = "INSERT INTO users (name, email, password_digest, created_at, updated_at) VALUES #{inserts.join(", ")}"
  User.connection.execute sql
end
end_time = Time.now
elapse = (end_time - start_time)
puts "200000 users in #{elapse.round(4)}s!"

start_time = Time.now
  for i in 1..200000 do
    inserts = []
    n = i%4
    inserts << "('#{place1[n]}', '#{place2[n]}', 100, '12', '20', 'aaaaaa', 'BMW', 5, '1234567', '#{Date.today}', '#{Date.today}', #{user.id}, #{user.id}, 5, 0)"

    sql = "INSERT INTO drivers (departure, destination, price, depart_time, estimated_arrival_time, description, car_type, passenger_num, contact_info, created_at, updated_at, userid, user_id, drivers.left, like_num) VALUES #{inserts.join(", ")}"
    Driver.connection.execute sql
  end
end_time = Time.now
elapse = (end_time - start_time)
puts "200000 Drivers in #{elapse.round(4)}s!"

start_time = Time.now
  for i in 1..200000 do
    inserts = []
    n = i%4
    inserts << "('#{place1[n]}', '#{place2[n]}', '12:30', '20:30', 'aaaaaa', 5, '1234567', '#{Date.today}', '#{Date.today}', #{user.id})"

    sql = "INSERT INTO hitchers (departure, destination, depart_time, arrival_time, description, num, contact_info, created_at, updated_at, user_id) VALUES #{inserts.join(", ")}"
    Hitcher.connection.execute sql
  end
end_time = Time.now
elapse = (end_time - start_time)
puts "200000 Hitchers in #{elapse.round(4)}s!"
