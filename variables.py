from RPA.Robocloud.Secrets import Secrets

secrets = Secrets()
USER_NAME = secrets.get_secret("CaptureFastCredentials")["username"]
PASSWORD = secrets.get_secret("CaptureFastCredentials")["password"]
TEAMID = secrets.get_secret("CaptureFastCredentials")["teamid"]
