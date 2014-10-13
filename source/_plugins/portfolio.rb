# A plugin that creates portfolio pages based on data files.
#
# - Reads all `.yml` data files inside "_projects"
#
# Source:
# https://github.com/flatterline/jekyll-plugins/

module Jekyll

  # The main page of the Portfolio
  #
  # Shows the featured projects
  class PortfolioIndex < Page
    def initialize(site, base, dir)
      @site = site
      @base = base
      @dir  = dir
      @name = "index.html"

      @layouts_dir  = File.join(base, '_layouts')
      @projects_dir = File.join(base, '_projects')

      self.process(@name)
      self.read_yaml(@layouts_dir, 'portfolio-highlights.html')
      self.data['projects'] = self.get_projects(site)
    end

    def get_projects(site)
      {}.tap do |projects|
        Dir["#{@projects_dir}/*.yml"].each do |path|
          name   = File.basename(path, '.yml')
          config = YAML.load(File.read(path))

          if config['published'] and config['featured']
            projects[name] = config
          end
        end
      end
    end
  end

  # Index for the projects under the "websites"
  # category.
  class PortfolioWebsitesIndex < Page
    def initialize(site, base, dir)
      @site = site
      @base = base
      @dir  = dir
      @name = "websites.html"

      @layouts_dir  = File.join(base, '_layouts')
      @projects_dir = File.join(base, '_projects')

      self.process(@name)
      self.read_yaml(@layouts_dir, 'portfolio-websites.html')
      self.data['projects'] = self.get_projects(site)
    end

    def get_projects(site)
      {}.tap do |projects|
        Dir["#{@projects_dir}/*.yml"].each do |path|
          name   = File.basename(path, '.yml')
          config = YAML.load(File.read(path))

          if config['published'] and config['type'] == 'website'
            projects[name] = config
          end
        end
      end
    end
  end

  # Index for the projects under the "websites"
  # category.
  class PortfolioGraphicalArtsIndex < Page
    def initialize(site, base, dir)
      @site = site
      @base = base
      @dir  = dir
      @name = "arts.html"

      @layouts_dir  = File.join(base, '_layouts')
      @projects_dir = File.join(base, '_projects')

      self.process(@name)
      self.read_yaml(@layouts_dir, 'portfolio-graphical-arts.html')
      self.data['projects'] = self.get_projects(site)
    end

    def get_projects(site)
      {}.tap do |projects|
        Dir["#{@projects_dir}/*.yml"].each do |path|
          name   = File.basename(path, '.yml')
          config = YAML.load(File.read(path))

          if config['published'] and config['type'] == 'art'
            projects[name] = config
          end
        end
      end
    end
  end

  # The index.html page for each project.
  #
  class ProjectIndex < Page
    def initialize(site, base, dir, path)
      @site     = site
      @base     = base
      @dir      = dir
      @name     = "index.html"
      self.data = YAML.load(File.read(File.join(@base, path)))

      self.process(@name) if self.data['published']
    end
  end

  # Generator that will get called by Jekyll
  # It creates all the pages above.
  #
  class GeneratePortfolio < Generator
    safe true
    priority :normal

    def generate(site)
      @layouts_dir  = File.join(site.source, '_layouts')
      @projects_dir = File.join(site.source, '_projects')

      self.write_portfolio(site)
    end

    # Loops through the list of project pages and processes
    # each one.
    #
    def write_portfolio(site)
      if Dir.exists?(@projects_dir)
        previous_dir = Dir.pwd

        Dir.chdir(@projects_dir)
        Dir["*.yml"].each do |path|
          name = File.basename(path, '.yml')
          file = File.join('_projects', path)

          self.write_project_index(site, file, name)
        end

        Dir.chdir(site.source)
        self.write_portfolio_index(site)

        Dir.chdir previous_dir

      else
        $stderr.puts "Warning: Could not load plugin 'portfolio.rb' because '#{@projects_dir}' doesn't exist"
      end
    end

    # Creates the index.html file for a single
    # project.
    #
    def write_project_index(site, path, name)
      project = ProjectIndex.new(site, site.source, "#{name}", path)

      if project.data['published']
        project.render(site.layouts, site.site_payload)
        project.write(site.dest)

        site.pages << project
        site.static_files << project
      end
    end

    def write_portfolio_index(site)
      portfolio = PortfolioIndex.new(site, site.source, "")
      portfolio.render(site.layouts, site.site_payload)
      portfolio.write(site.dest)

      site.pages << portfolio
      site.static_files << portfolio

      portfolio = PortfolioWebsitesIndex.new(site, site.source, "")
      portfolio.render(site.layouts, site.site_payload)
      portfolio.write(site.dest)

      site.pages << portfolio
      site.static_files << portfolio

      portfolio = PortfolioGraphicalArtsIndex.new(site, site.source, "")
      portfolio.render(site.layouts, site.site_payload)
      portfolio.write(site.dest)

      site.pages << portfolio
      site.static_files << portfolio
    end

  end
end

