import random
import string

def random_key() -> str:
    return ''.join(random.choices(string.ascii_lowercase + string.digits, k=5))
