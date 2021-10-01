class ProfileDecorator < Draper::Decorator
  delegate_all

  def pluralize_characters
    'Character'.pluralize(characters_count)
  end

  def display_avatar
    if avatar_URL.nil?
      require 'aes' # AES encryption
      iv = ENV['IV_KEY']
      encrypted = AES.encrypt(username, ENV['AES_KEY'], { iv: iv })
      seed = encrypted[iv.length]
      "https://avatars.dicebear.com/api/pixel-art-neutral/#{seed}.svg" || "https://avatar.oxro.io/avatar.svg?name=#{username}"
    else
      avatar_URL
    end
  end

  def display_location_with_icon
    return unless location?

    string = '<i class="fas fa-map-marker" role="img" aria-label="Icon"></i> ' << location
    helpers.sanitize(string)
  end

  def display_about_me
    about_me || helpers.sanitize('<i>No information available.</i>')
  end

  def display_twitter_paragraph
    return unless twitter_username?

    string = '<p class="mb-0"><i class="fab fa-twitter twitter-color mx-1" role="img" aria-label="Twitter Icon"></i>'
    string << '<a href="http://www.twitter.com/' << twitter_username << '" class="link-secondary" target="_blank">'
    string << twitter_username << '</a></p>'
    helpers.sanitize(string)
  end

  def display_instagram_paragraph
    return unless instagram_username?

    string = '<p class="mb-0"><i class="fab fa-instagram instagram-color mx-1" role="img" aria-label="Instagram Icon"></i>'
    string << '<a href="http://www.instagram.com/' << instagram_username << '" class="link-secondary" target="_blank">'
    string << instagram_username << '</a></p>'
    helpers.sanitize(string)
  end

  def display_discord_paragraph
    return unless discord_username?

    string = '<p class="mb-0"><i class="fab fa-discord discord-color" role="img" aria-label="Discord Icon"></i> '
    string << discord_username << '</p>'
    helpers.sanitize(string)
  end
end
