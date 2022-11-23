json.(user, :id, :email, :role, :first_name, :last_name, :address, :phone_number)
json.token user.generate_jwt