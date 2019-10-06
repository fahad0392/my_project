from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

print("--------------------------------------forms.py")
class SignUpForm(forms.Form):
    print("=============================")
    username = forms.CharField(max_length=30,  help_text='Enter user Name')
    print("=================use",username)
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')
    print("==================email",email)
    password1 = forms.CharField(max_length=16, widget=forms.PasswordInput(
        attrs={'class': 'form-control', 'placeholder': 'Password from numbers and letters of the Latin alphabet'}))
    password2 = forms.CharField(max_length=16, widget=forms.PasswordInput(
        attrs={'class': 'form-control', 'placeholder': 'Password confirm'}))

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')

    def clean_username(self):
        print("===============oooo")
        username = self.cleaned_data['username']
        if len(username) < 6:
            return forms.ValidationError('First name must contain only letters')
        return username
