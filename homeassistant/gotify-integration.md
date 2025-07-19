# Home Assistant Integration for Gotify 

Gotify is a simple server for sending and receiving messages

https://gotify.net/

## Home Assistant Integration

https://github.com/1RandomDev/homeassistant-gotify

`/root/homeassistant/configuration.yaml`

```
...
notify:
  - name: "my gotify"
    platform: gotify
    url: <gotify_url>
    token: <gotify_token>
    verify_ssl: true # optional, default true
```

Example automation:

```
alias: Gotify test
description: Gotify test
triggers:
  - device_id: 0bcff34786da651f7e8259abb99ff9e2
    domain: zha
    type: remote_button_short_press
    subtype: remote_button_short_press
    trigger: device
actions:
  - data:
      message: This is a test message.
    action: notify.my_gotify
mode: single
```
