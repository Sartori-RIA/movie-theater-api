namespace :db do
  desc 'Erase and Fill database'
  task populate: :environment do

    [User].each(&:delete_all)

    User.create_with(
        first_name: Faker::Name.first_name_men,
        last_name: Faker::Name.last_name,
        role: Role.find_by(name: 'ADMIN'),
        password: '123123123',
        confirmed_at: Time.now
    ).find_or_create_by!(email: 'admin@email.com', cell_phone: '99999-9999')

  end
end
