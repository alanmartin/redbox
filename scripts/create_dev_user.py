import os

import django
from django.contrib.auth import get_user_model

# Set up Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'redbox_app.settings')
django.setup()

# Get the User model
User = get_user_model()

# Create the user
email = 'developer@example.com'
password = 'devpassword123'  # Change this to your preferred password

# Create or get the user
user, created = User.objects.get_or_create(
    email=email,
    defaults={
        'is_superuser': True,
        'is_staff': True,
        'is_active': True
    }
)

# Set the password
user.set_password(password)
user.save()

if created:
    print(f"Created new user: {email}")
else:
    print(f"Updated existing user: {email}")