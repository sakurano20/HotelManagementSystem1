# Strong password hashing using Werkzeug's PBKDF2 (uses 150,000 iterations by default)
def hash_password(password):
    return generate_password_hash(password)

def verify_password(password, stored_hash):
    if not stored_hash:
        return False
    # Direct comparison for plain-text passwords (legacy)
    if password == stored_hash:
        return True
    # Try werkzeug check
    try:
        return check_password_hash(stored_hash, password)
    except:
        return False

# List of common timezones for the settings dropdown
COMMON_TIMEZONES = [
    ('UTC', 'UTC (Coordinated Universal Time)'),
    ('Africa/Cairo', 'Africa - Cairo (GMT+2)'),
    ('Africa/Johannesburg', 'Africa - Johannesburg (GMT+2)'),
    ('Africa/Lagos', 'Africa - Lagos (GMT+1)'),
    ('America/Anchorage', 'America - Anchorage (GMT-9)'),
    ('America/Argentina/Buenos_Aires', 'America - Buenos Aires (GMT-3)'),
    ('America/Bogota', 'America - Bogota (GMT-5)'),
    ('America/Chicago', 'America - Chicago (GMT-6)'),
    ('America/Denver', 'America - Denver (GMT-7)'),
    ('America/Halifax', 'America - Halifax (GMT-4)'),
    ('America/Lima', 'America - Lima (GMT-5)'),
    ('America/Los_Angeles', 'America - Los Angeles (GMT-8)'),
    ('America/Mexico_City', 'America - Mexico City (GMT-6)'),
    ('America/New_York', 'America - New York (GMT-5)'),
    ('America/Panama', 'America - Panama (GMT-5)'),
    ('America/Phoenix', 'America - Phoenix (GMT-7)'),
    ('America/Santiago', 'America - Santiago (GMT-4)'),
    ('America/Sao_Paulo', 'America - Sao Paulo (GMT-3)'),
    ('America/Toronto', 'America - Toronto (GMT-5)'),
    ('America/Vancouver', 'America - Vancouver (GMT-8)'),
    ('Asia/Baghdad', 'Asia - Baghdad (GMT+3)'),
    ('Asia/Bangkok', 'Asia - Bangkok (GMT+7)'),
    ('Asia/Colombo', 'Asia - Colombo (GMT+5:30)'),
    ('Asia/Dhaka', 'Asia - Dhaka (GMT+6)'),
    ('Asia/Dubai', 'Asia - Dubai (GMT+4)'),
    ('Asia/Ho_Chi_Minh', 'Asia - Ho Chi Minh (GMT+7)'),
    ('Asia/Hong_Kong', 'Asia - Hong Kong (GMT+8)'),
    ('Asia/Jakarta', 'Asia - Jakarta (GMT+7)'),
    ('Asia/Jerusalem', 'Asia - Jerusalem (GMT+2)'),
    ('Asia/Karachi', 'Asia - Karachi (GMT+5)'),
    ('Asia/Kathmandu', 'Asia - Kathmandu (GMT+5:45)'),
    ('Asia/Kolkata', 'Asia - Kolkata (GMT+5:30)'),
    ('Asia/Kuala_Lumpur', 'Asia - Kuala Lumpur (GMT+8)'),
    ('Asia/Manila', 'Asia - Manila (GMT+8)'),
    ('Asia/Seoul', 'Asia - Seoul (GMT+9)'),
    ('Asia/Shanghai', 'Asia - Shanghai (GMT+8)'),
    ('Asia/Singapore', 'Asia - Singapore (GMT+8)'),
    ('Asia/Taipei', 'Asia - Taipei (GMT+8)'),
    ('Asia/Tehran', 'Asia - Tehran (GMT+3:30)'),
    ('Asia/Tokyo', 'Asia - Tokyo (GMT+9)'),
    ('Australia/Brisbane', 'Australia - Brisbane (GMT+10)'),
    ('Australia/Melbourne', 'Australia - Melbourne (GMT+10)'),
    ('Australia/Perth', 'Australia - Perth (GMT+8)'),
    ('Australia/Sydney', 'Australia - Sydney (GMT+10)'),
    ('Europe/Amsterdam', 'Europe - Amsterdam (GMT+1)'),
    ('Europe/Athens', 'Europe - Athens (GMT+2)'),
    ('Europe/Berlin', 'Europe - Berlin (GMT+1)'),
    ('Europe/Brussels', 'Europe - Brussels (GMT+1)'),
    ('Europe/Budapest', 'Europe - Budapest (GMT+1)'),
    ('Europe/Dublin', 'Europe - Dublin (GMT+0)'),
    ('Europe/Helsinki', 'Europe - Helsinki (GMT+2)'),
    ('Europe/Istanbul', 'Europe - Istanbul (GMT+3)'),
    ('Europe/Lisbon', 'Europe - Lisbon (GMT+0)'),
    ('Europe/London', 'Europe - London (GMT+0)'),
    ('Europe/Madrid', 'Europe - Madrid (GMT+1)'),
    ('Europe/Moscow', 'Europe - Moscow (GMT+3)'),
    ('Europe/Oslo', 'Europe - Oslo (GMT+1)'),
    ('Europe/Paris', 'Europe - Paris (GMT+1)'),
    ('Europe/Prague', 'Europe - Prague (GMT+1)'),
    ('Europe/Rome', 'Europe - Rome (GMT+1)'),
    ('Europe/Stockholm', 'Europe - Stockholm (GMT+1)'),
    ('Europe/Vienna', 'Europe - Vienna (GMT+1)'),
    ('Europe/Warsaw', 'Europe - Warsaw (GMT+1)'),
    ('Europe/Zurich', 'Europe - Zurich (GMT+1)'),
    ('Pacific/Auckland', 'Pacific - Auckland (GMT+12)'),
    ('Pacific/Fiji', 'Pacific - Fiji (GMT+12)'),
    ('Pacific/Honolulu', 'Pacific - Honolulu (GMT-10)'),
    ('Pacific/Port_Moresby', 'Pacific - Port Moresby (GMT+10)'),
]
