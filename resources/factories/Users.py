
from faker import Faker
fake = Faker()

def factory_user():
    user =  {
        'name': 'Sayaka',
        'lastname': 'Miki',
        'email': 'kyosaya32@gmail.com',
        'password': 'kyosaya'
    }
    
    return user

def factory_fake_user():
    user =  {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': fake.free_email(),
        'password': 'kyosaya'
    }
    
    return user