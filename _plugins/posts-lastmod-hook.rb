#!/usr/bin/env ruby
#
# Check for changed posts

require 'date'

Jekyll::Hooks.register :posts, :post_init do |post|

  commit_num = `git rev-list --count HEAD "#{ post.path }"`

  if commit_num.to_i > 1
    lastmod_date_str = `git log -1 --pretty="%ad" --date=iso "#{ post.path }"`
    lastmod_date = DateTime.parse(lastmod_date_str)
    post_date = post.date.to_datetime

    # Only set last_modified_at if the day is different from the post date
    if lastmod_date.strftime('%Y-%m-%d') != post_date.strftime('%Y-%m-%d')
      post.data['last_modified_at'] = lastmod_date_str
    end
  end

end
