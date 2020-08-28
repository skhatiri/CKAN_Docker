# CKAN_Docker
Running CKAN extensions in Docker

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

1. This extension uses public GET APIs for tag autocomplete and search.

check [``tag_restriction.ini``](tag_restriction.ini) for details on their prerequisites

2. You should have Docker before using this docker image

### Installing

1. Clone the repository
```
$ git clone https://github.com/skhatiri/CKAN_tag_extension.git
```

2. Edit tag_restriction configs from ``tag_restriction.ini``.

Provide your own apis for tag autocomplete and search (the default config uses [GFBio Terminology APIs](https://terminologies.gfbio.org/api/))


#### On Docker

3. Copy [``.env.template``](.env.template) to a new ``.env`` file and edit configurations if needed

4. Go to the root folder of the project and run it using ``docker-compose``
```
$ docker-compose up --build -d
```

5. Go to http://localhost:5000 and login with ``user:"admin", password:"adminadmin"`` or your customized user in ``.env`` file 


