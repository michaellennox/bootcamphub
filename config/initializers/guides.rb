destination = Hanami.root.join('public/guides')
guides_root = Hanami.root.join('apps', 'guides')

Jekyll::Site.new(
  Jekyll.configuration({
    "config" => guides_root.join('_config.yml').to_s,
    "source" => guides_root.to_s,
    "destination" => destination.to_s
  })
).process
