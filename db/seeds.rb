# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Project.destroy_all

Project.create([
  {
    project_name: 'Baked Expectations', 
    project_type: 'Commercial - Interior',
    project_tags: ['commercial', 'restaurants', 'retail'],
    description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur recusandae labore possimus consectetur nobis reprehenderit impedit, ipsa dolor excepturi mollitia eum consequuntur! Facere, maiores.'
  },
    {
    project_name: 'Deck & Boardwalk',
    project_type: 'Residental - Exterior',
    project_tags: ['residential', 'deck', 'yard'],
    description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur recusandae labore pos'
  },
    {
    project_name: 'Deck & Pergola',
    project_type: 'Residential - Exterior',
    project_tags: ['residential', 'deck', 'yard'],
    description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur recusandae labore possimus conses.'
  },
    {
    project_name: 'Boys Bedroom',
    project_type: 'Residential - Interior',
    project_tags: ['residential', 'interior', 'bedroom', 'custom'],
    description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur recusandae labore possimus '
  },
    {
    project_name: 'Built-In Cabinets',
    project_type: 'Residential - Interior',
    project_tags: ['interior, residential, custom, cabinets'],
    description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur recusandae labore possimus consectetur nobis reprehenderit impedit, ipsa dolor excepturi mollitia eum consequuntur! Facere, maiores.'
  },
    {
    project_name: 'Ceiling Details',
    project_type: 'Residential - Interior',
    project_tags: ['residential', 'interior', 'custom'],
    description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur recusandae labore possimus consectetur nobis reprehenderit impedit, ipsa dolor excepturi mollitia eum consequuntur! Facere, maiores.'
  },
    {
    project_name: 'Tuxedo Sunrom', 
    project_type: 'Residential - Interior',
    project_tags: ['residentail', 'framing', 'additions'],
    description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur recusandae labore possimus consectetur nobis reprehenderit impedit, ipsa dolor excepturi mollitia eum consequuntur! Facere, maiores.'
  },
])