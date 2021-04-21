# Getting Started:

CLI Command to spin up dev server
```
npm run dev
```

# Site Routes (Client):

|development port       | endpoint               | description                                                     |
|:----------------------|:-----------------------|:----------------------------------------------------------------|
|`http://localhost:5050`| `/`	                   | Re-directs based on if authenticated: `/dashboard` or  `/login` |
|`http://localhost:5050`| `/login`               | Re-directs to `/dashboard` if logged in.                        |
|`http://localhost:5050`| `/dashboard`           | Act as site map (links to every other page)                     |
|`http://localhost:5050`| `/addEvent`            | Form Data to add an event                                       |
|`http://localhost:5050`| `/tournaments`         | Lists out all the tournaments, upcoming / archived              |
|`http://localhost:5050`| `/tournament/:id`      | Detail Page for tournament                                      |
|`http://localhost:5050`| `/tournament/:id/edit` | Form Data to edit an event                                      |
|`http://localhost:5050`| `/contacts`            | lists out in table view the contacts, 40 at a time.             |
|`http://localhost:5050`| `/messages`            | Lists out all messages from all contacts. `"contacts.messages"` |

# API Routes (Server):

| method |development port       | endpoint      | description                |
|:-------|:----------------------|:--------------|:---------------------------|
| GET    |`http://localhost:5051`| `/api/events` | Get's a list of all events |


# Data Models:

- Tournaments
- Practices
- Events (Tournaments + Practices)
- Contacts
  + email, name, location, etc.
  + Messages (Comments/questions) Array.
    - to
    - from
    - contactId

