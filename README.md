# Freecycle Mapper #

Google mapping offers on Freecycle Portland.
#Config
'mail_config.rb should be a ruby file in the following format:
<pre><code>
  module FreeCycleMap
      USER_CONFIG = {
      :user_name => "username",
      :password => "password" }
    MAIL_CONFIG = {
      :server => "mailserver",
      :group => "freecycle mailing list email address" }
 end
</code></pre>