User.delete_all
Driver.delete_all
Hitcher.delete_all
place1 = ["Santa Barbara, CA, United States", "Los Angeles, CA, United States","San Diego, CA, United States","San Francisco, CA, United States"]
place2 = ["Arizona, United States", "Utah, United States", "Illinois, United States","San Antonio, TX,  United States"]
username = "user"
pwd = "111111"
salt = BCrypt::Engine.generate_salt
password = BCrypt::Engine.hash_secret(pwd, salt)
drivername = "driver"
usernames = Array.new(10000){ |i| "user" + (i+1).to_s }
user  = User.create!(
  name: "postuser",
        email: "postemail@example.com",
  password: "111111",
        password_confirmation: "111111"
  )

ActiveRecord::Base.transaction do
start_time = Time.now
  
  for i in 1..10000 do
    inserts = []
    inserts << "('#{usernames[i]}', '#{usernames[i]}@example.com', '#{password}', '#{Date.today}', '#{Date.today}')"
  
  sql = "INSERT INTO users (name, email, password_digest, created_at, updated_at) VALUES #{inserts.join(", ")}"
  User.connection.execute sql
end
end_time = Time.now
elapse = (end_time - start_time)
puts "10000 users in #{elapse.round(4)}s!"

start_time = Time.now
  for i in 1..10000 do
    inserts = []
    n = i%4
    inserts << "('#{place1[n]}', '#{place2[n]}', 100, '12', '20', 'aaaaaa', 'BMW', 5, '1234567', '#{Date.today}', '#{Date.today}', #{user.id}, #{user.id}, 5, 0)"

    sql = "INSERT INTO drivers (departure, destination, price, depart_time, estimated_arrival_time, description, car_type, passenger_num, contact_info, created_at, updated_at, userid, user_id, drivers.left, like_num) VALUES #{inserts.join(", ")}"
    Driver.connection.execute sql
  end
end_time = Time.now
elapse = (end_time - start_time)
puts "10000 Drivers in #{elapse.round(4)}s!"

start_time = Time.now
  for i in 1..10000 do
    inserts = []
    n = i%4
        driver = user.drivers.create!(
    departure: place1[n],
        destination: place2[n],
    price: 100,
    depart_time: "12:30",
    estimated_arrival_time: "20:30",
    description: "aaaaaa",
    car_type: "BMW",
    passenger_num: 5,
    contact_info: "1234567",
        left: 5
    )
        hitcher = user.hitchers.create!(
            departure: place1[n],
            destination: place2[n],
            depart_time: "10:00",
            arrival_time: "12:30",
            description: "aaaa",
            num: 5,   
            contact_info: "1234567" 
        )
    end
end
