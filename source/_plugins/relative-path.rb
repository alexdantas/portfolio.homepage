# Jekyll plugin that allows to use relative paths
# when including files.
#
# So instead of using "/" to reference the root
# directory on a server, you can put "{{ page.relative }}"
# and it will calculate how many "../" it has to do
# to get to the root directory.
#
# Thanks, Jeff Clement!
# https://jclement.ca/
#
# Source:
# https://jclement.ca/2013/12/06/relative_jekyll_paths.html

module Jekyll

  # Applying this plugin to all pages
  class Page

    def relative
      "../" * (url.split("/").length - 2)
    end

    def to_liquid(attrs = ATTRIBUTES_FOR_LIQUID)
      super(attrs + %w[
          relative
    ])

    end
  end

  # Applying this plugin to all posts
  class Post

    def relative
      "../" * (url.split("/").length - 2)
    end

    def to_liquid(attrs = ATTRIBUTES_FOR_LIQUID)
      super(attrs + %w[
          relative
    ])

    end
  end

end

