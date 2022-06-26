
user = User.find_by(
  email: 'test2@test.com',
) || User.create(
  name: 'Test User',
  email: 'test2@test.com',
  password: 'password'
)

subjects = [
  Subject.find_or_create_by(
    name: 'First aids',
    min_hours: 20
  ),
  Subject.find_or_create_by(
    name: 'Laws',
    min_hours: 20
  ),
  Subject.find_or_create_by(
    name: 'Mechanic',
    min_hours: 20
  )
]

Subscription.find_by(user_id: user.id,) || Subscription.create(user_id: user.id, subjects: subjects)