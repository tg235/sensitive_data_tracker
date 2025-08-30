# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
DataRecord.create(name: "John Doe", email: "john@example.com", phone: "1234567890", pan: "ABCDE1234F", aadhaar: "111122223333", is_sensitive: true)
DataRecord.create(name: "Jane Smith", email: "jane@example.com", phone: "9876543210", pan: "XYZAB5678K", aadhaar: "444455556666", is_sensitive: false)
