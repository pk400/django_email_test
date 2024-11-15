from django.shortcuts import render
from django.core.mail import EmailMessage


# Create your views here.
def index(request):
    if request.method == "GET":
        return render(request, "index.html")
    elif request.method == "POST":
        print("Sending email")
        message = EmailMessage(
            subject="Test Email",
            body="This is a test email",
            from_email="heyitsaro.joel@gmail.com",
            to=["heyitsaro.joel+test@gmail.com"],
        )
        message.metadata = {
            "hello": "world",
        }
        message.send()
        return render(request, "index.html")
