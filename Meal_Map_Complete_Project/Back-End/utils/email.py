# backend/utils/email.py

# Only handles OTP sending / printing
def send_otp_email(email, otp):
    """
    Dev mode: just print OTP instead of sending email
    """
    print(f"[DEV] OTP for {email}: {otp}")
