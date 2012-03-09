# WhitLi

Ruby wrapper for the [WhitLi API](http://developer.whit.li), provides an easy-to-use wrapper for LinkedIn's Oauth/XML APIs. Originally developed for [ResumUP](http://resumup.com)

## Installation

Install via rubygems

    [sudo] gem install whit_li

Or via bundler:
    
    gem "whit_li"


## Usage

### Authenticate

LinkedIn's API uses Oauth for authentication. Luckily, the LinkedIn gem hides most of the gory details from you.

    require 'rubygems'
    require 'whit_li'

    client = WhitLi::Client.new "api_key_from_whitli"

    # import token from facebook
    client.import_token facebook_id, facebook_token

    # populate data from facebook to whitli
    client.populate facebook_id

    # manual import data to whitly
    client.import_generic request_body

    # retrieve vectors for user by facebook_id and key. More about keys read at http://developer.whit.li/docs/read/How_to_Interpret_a_Whitli_Key
    vectors = client.get facebook_id, key_id

    # compare users in contexts. More about context read at http://developer.whit.li/docs/read/How_to_Interpret_a_Whitli_Key
    vectors = client.compare facebook_id_1, facebook_id_2, context_id



## TODO

* Add 146% Test coverage
* Add vector parser

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Commit, do not mess with rakefile, version, or history.
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c)2012 [Sergey Efremov](https://github.com/EvilFaeton). See LICENSE for details.