3.times do |profile_item|
	Profile.create!(
		title: "Profile title: #{profile_item}",
		subtitle: "Winter",
		body: "This is the beginning of my first App",
		main_image: "http://via.placeholder.com/600x300",
		thumb_image: "http://via.placeholder.com/250x300"
	)

end


	# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
