require 'obscenity/active_model'

Obscenity.configure do |config|
  config.whitelist   = [
    'aids', 'anal', 'anus', 'ass', 'as$', 'beaver', 'bite me', 'buttcrack', 'condom', 'cracker', 'cum', 'devil', 'dick', 'dildo',
    'drugs', 'ecstacy', 'eggplant', 'flamer', 'flip', 'fore skin', 'foreskin', 'half breed', 'halfbreed', 'hell', 'hermaphrodite', 'herpes', 'ho', 'incest', 'kill', 'manwhore', 'man whore',
    'murder', 'niger', 'nip', 'nipple', 'pimp', 'piss', 'rectum', 'satanic', 'slope',
    'suicide', 'taint', 'testes', 'testicles', 'whore'
  ]
end
