require 'obscenity/active_model'

Obscenity.configure do |config|
  config.whitelist   = [
    'aids', 'beaver', 'bite me', 'buttcrack', 'condom', 'cracker', 'cum', 'devil',
    'drugs', 'ecstacy', 'eggplant', 'flamer', 'flip', 'hell', 'incest', 'kill', 
    'murder', 'niger', 'nip', 'nipple', 'pimp', 'piss', 'rectum', 'satanic', 'slope',
    'suicide', 'taint', 'testes', 'testicles'
  ]
end
