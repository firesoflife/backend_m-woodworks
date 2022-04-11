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

Gallery.destroy_all

Gallery.create([
  {
    title: 'Baked Expectations',
    cover_image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063082/M-Woodworks/Baked%20Expectations/IMG_0038_a58nzj.jpg',
    alt_text: 'Gallery cover image for Baked Expectations project',
    project_id: 1
  },
  {
    title: 'Deck & Boardwalk',
    cover_image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063829/M-Woodworks/Exterior%20-%20IPE%20Deck%20and%20Boardwalk/IMG_0511_qvncjn.jpg',
    alt_text: 'Gallery cover image for Deck & Boardwalk project',
    project_id: 2
  },
  {
    title: 'Deck & Pergola',
    cover_image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064596/M-Woodworks/Exterior%20-%20St.%20Norbert%20Deck%20and%20Pergola/IMG_0300_alqk45.jpg',
    alt_text: 'Gallery cover image for Deck & Pergola project',
    project_id: 3
  },
  {
    title: 'Boys Bedroom',
    cover_image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063648/M-Woodworks/Residential%20-%20Boys%20Bedroom/IMG_0432_ewpf3v.jpg',
    alt_text: 'Gallery cover image for Deck & Pergola project',
    project_id: 4
  },
  {
    title: 'Built-In Cabinets',
    cover_image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064792/M-Woodworks/Residential%20-%20Built-in%20Cabinets/IMG_0398_aioq8t.jpg',
    alt_text: 'Gallery cover image for Deck & Pergola project',
    project_id: 5
  },
  {
    title: 'Ceiling Detail',
    cover_image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064706/M-Woodworks/Residential%20-%20Ceiling%20Detail/IMG_0107_d4ss1f.jpg',
    alt_text: 'Gallery cover image for Ceiling Detail project',
    project_id: 6
  },
  {
    title: 'Sunroom',
    cover_image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064315/M-Woodworks/Tuxedo%20Sunroom/IMG_0642_uuunlp.jpg',
    alt_text: 'Gallery cover image for Sunroom project',
    project_id: 7
  }
               ])


Image.destroy_all

Image.create([
  {
    gallery_id: 1,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063191/M-Woodworks/Baked%20Expectations/image_pmfyas.jpg',
    alt_text: 'Custom wood service counter in Baked Expectations'
  },
  {
    gallery_id: 1,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063096/M-Woodworks/Baked%20Expectations/image_fimads.jpg',
    alt_text: 'Custom wood service counter in Baked Expectations'
  },
  {
    gallery_id: 1,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063088/M-Woodworks/Baked%20Expectations/image_gui1nn.jpg',
    alt_text: 'custom commercial storage cabinet at baked expections'
  },
  {
    gallery_id: 1,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063082/M-Woodworks/Baked%20Expectations/IMG_0038_a58nzj.jpg',
    alt_text: 'Custom wood service counter in Baked Expectations'
  },
  {
    gallery_id: 1,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063078/M-Woodworks/Baked%20Expectations/IMG_0060_tswzih.jpg',
    alt_text: 'custom stock retail shelving for commercial cafe, baked expectations'
  },
  {
    gallery_id: 1,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063073/M-Woodworks/Baked%20Expectations/image_ccp3l6.jpg',
    alt_text: 'custom stock retail shelving for commercial cafe, baked expectations'
  },
  {
    gallery_id: 1,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063065/M-Woodworks/Baked%20Expectations/image_obfl7q.jpg',
    alt_text: 'custom stock retail shelving for commercial cafe, baked expectations'
  },
  {
    gallery_id: 1,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063004/M-Woodworks/Baked%20Expectations/IMG_0331_fzsa8w.jpg',
    alt_text: 'custom stock retail shelving for commercial cafe, baked expectations'
  },

  {
    gallery_id: 2,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063833/M-Woodworks/Exterior%20-%20IPE%20Deck%20and%20Boardwalk/image_fo52pa.jpg',
    alt_text: 'Wooden deck boardwalk for outdoor residentail job'
  },
  {
    gallery_id: 2,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063833/M-Woodworks/Exterior%20-%20IPE%20Deck%20and%20Boardwalk/image_fo52pa.jpg',
    alt_text: 'Wooden deck boardwalk for outdoor residentail job'
  },
  {
    gallery_id: 2,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063823/M-Woodworks/Exterior%20-%20IPE%20Deck%20and%20Boardwalk/image_ncydqb.jpg',
    alt_text: 'custom design-build deck for outdoor residential job'
  },
  {
    gallery_id: 2,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063818/M-Woodworks/Exterior%20-%20IPE%20Deck%20and%20Boardwalk/IMG_0653_pbmfyz.jpg',
    alt_text: 'custom design-build deck for outdoor residential job'
  },
  {
    gallery_id: 2,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063812/M-Woodworks/Exterior%20-%20IPE%20Deck%20and%20Boardwalk/IMG_0036_bdyjh0.jpg',
    alt_text: 'custom design-build deck for outdoor residential job'
  },

  {
    gallery_id: 3,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064624/M-Woodworks/Exterior%20-%20St.%20Norbert%20Deck%20and%20Pergola/IMG_0417_hgy3z8.jpg',
    alt_text: 'custom deck stairs'
  },
  {
    gallery_id: 3,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064619/M-Woodworks/Exterior%20-%20St.%20Norbert%20Deck%20and%20Pergola/IMG_0351_in0suv.jpg',
    alt_text: 'custom deck stairs'
  },
  {
    gallery_id: 3,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064615/M-Woodworks/Exterior%20-%20St.%20Norbert%20Deck%20and%20Pergola/image_avhy0j.jpg',
    alt_text: 'custom deck transition feature'
  },
  {
    gallery_id: 3,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064609/M-Woodworks/Exterior%20-%20St.%20Norbert%20Deck%20and%20Pergola/image_lshsyh.jpg',
    alt_text: 'custom deck stairs'
  },
  {
    gallery_id: 3,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064605/M-Woodworks/Exterior%20-%20St.%20Norbert%20Deck%20and%20Pergola/IMG_0379_lsubfg.jpg',
    alt_text: 'custom wood pergola'
  },
  {
    gallery_id: 3,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064600/M-Woodworks/Exterior%20-%20St.%20Norbert%20Deck%20and%20Pergola/IMG_0726_ozfk76.jpg',
    alt_text: 'custom wood pergola'
  },
  {
    gallery_id: 3,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064596/M-Woodworks/Exterior%20-%20St.%20Norbert%20Deck%20and%20Pergola/IMG_0300_alqk45.jpg',
    alt_text: 'custom wood pergola'
  },
  {
    gallery_id: 3,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064585/M-Woodworks/Exterior%20-%20St.%20Norbert%20Deck%20and%20Pergola/IMG_0729_hu2bfv.jpg',
    alt_text: 'custom deck and stairs'
  },
  {
    gallery_id: 3,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064581/M-Woodworks/Exterior%20-%20St.%20Norbert%20Deck%20and%20Pergola/IMG_0573_tre7ff.jpg',
    alt_text: 'custom deck and stairs'
  },

  {
    gallery_id: 4,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063653/M-Woodworks/Residential%20-%20Boys%20Bedroom/IMG_0247_hawtue.jpg',
    alt_text: 'wood, custom built ladder to hanging bunk bed'
  },
  {
    gallery_id: 4,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063648/M-Woodworks/Residential%20-%20Boys%20Bedroom/IMG_0432_ewpf3v.jpg',
    alt_text: 'custom hanging bunk for boys bedroom'
  },
  {
    gallery_id: 4,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063644/M-Woodworks/Residential%20-%20Boys%20Bedroom/IMG_0272_nb4atx.jpg',
    alt_text: 'underside of custom hanging bunk for boys bedroom'
  },
  {
    gallery_id: 4,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063637/M-Woodworks/Residential%20-%20Boys%20Bedroom/IMG_0682_dh10hm.jpg',
    alt_text: 'custom hanging bunk for boys bedroom'
  },
  {
    gallery_id: 4,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645063632/M-Woodworks/Residential%20-%20Boys%20Bedroom/IMG_0084_ews1oj.jpg',
    alt_text: 'custom hanging bunk for boys bedroom'
  },

  {
    gallery_id: 5,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064799/M-Woodworks/Residential%20-%20Built-in%20Cabinets/IMG_0675_rhlpkm.jpg',
    alt_text: 'front view of custom built-in cabinet for entertainment unit'
  },
  {
    gallery_id: 5,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064792/M-Woodworks/Residential%20-%20Built-in%20Cabinets/IMG_0398_aioq8t.jpg',
    alt_text: 'side view custom built-in cabinet for entertainment unit with TV on top'
  },
  {
    gallery_id: 5,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064787/M-Woodworks/Residential%20-%20Built-in%20Cabinets/IMG_0570_zbimdw.jpg',
    alt_text: 'side view custom built-in cabinet for entertainment unit with TV on top'
  },

  {
    gallery_id: 6,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064711/M-Woodworks/Residential%20-%20Ceiling%20Detail/IMG_0500_fnq2dt.jpg',
    alt_text: 'custom white, wood ceiling detail with light fixture'
  },
  {
    gallery_id: 6,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064706/M-Woodworks/Residential%20-%20Ceiling%20Detail/IMG_0107_d4ss1f.jpg',
    alt_text: 'custom white, wood ceiling detail with light fixture'
  },
  {
    gallery_id: 6,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064702/M-Woodworks/Residential%20-%20Ceiling%20Detail/IMG_0298_m96tt8.jpg',
    alt_text: 'alternative view of custom white, wood ceiling detail with light fixture'
  },

  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064315/M-Woodworks/Tuxedo%20Sunroom/IMG_0642_uuunlp.jpg',
    alt_text: 'interior view of wood detail and window openings in sunroom'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064306/M-Woodworks/Tuxedo%20Sunroom/IMG_0307_ihaizs.jpg',
    alt_text: 'interior view of wood detail in corner of sunroom'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064299/M-Woodworks/Tuxedo%20Sunroom/IMG_0661_ixn0is.jpg',
    alt_text: 'wide view interior of sunroom wood detail'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064273/M-Woodworks/Tuxedo%20Sunroom/IMG_0097_takpjg.jpg',
    alt_text: 'closeup view of corner transition in sunroom'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064267/M-Woodworks/Tuxedo%20Sunroom/IMG_0714_ghelim.jpg',
    alt_text: 'windows and wood details for custom woodworking sunroom'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064261/M-Woodworks/Tuxedo%20Sunroom/IMG_0409_yto5wy.jpg',
    alt_text: 'windows and wood details for custom woodworking sunroom'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064252/M-Woodworks/Tuxedo%20Sunroom/IMG_0197_k7yvx4.jpg',
    alt_text: 'Exterior of house corner soffit mitred transition in wood'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064245/M-Woodworks/Tuxedo%20Sunroom/IMG_0054_aeoybn.jpg',
    alt_text: 'close-up of exterior of house corner soffit mitred transition in wood'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064238/M-Woodworks/Tuxedo%20Sunroom/IMG_0100_cq0sz3.jpg',
    alt_text: 'entrance way covering with custom wood ceiling'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064234/M-Woodworks/Tuxedo%20Sunroom/IMG_0217_rb1pje.jpg',
    alt_text: 'exterior soffits and entrance covering in custom wood with mitred corners'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064226/M-Woodworks/Tuxedo%20Sunroom/IMG_0330_cwdych.jpg',
    alt_text: 'custom soffits in wood with built in vent'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064221/M-Woodworks/Tuxedo%20Sunroom/IMG_0479_xwiid0.jpg',
    alt_text: 'custom soffits in wood with built in vent'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064217/M-Woodworks/Tuxedo%20Sunroom/IMG_0462_sivedw.jpg',
    alt_text: 'framed out soffits for custom wood work - pre-finsish'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064212/M-Woodworks/Tuxedo%20Sunroom/IMG_0748_cbraky.jpg',
    alt_text: 'roof framed in wood for custom sunroom'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064208/M-Woodworks/Tuxedo%20Sunroom/IMG_0763_l1dyby.jpg',
    alt_text: 'framed-out sunroom addition - early build'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064202/M-Woodworks/Tuxedo%20Sunroom/IMG_0171_xx6nmo.jpg',
    alt_text: 'framed-out sunroom addition - early build'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064198/M-Woodworks/Tuxedo%20Sunroom/IMG_0365_s6w3gw.jpg',
    alt_text: 'roof framed in wood for custom sunroom'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064192/M-Woodworks/Tuxedo%20Sunroom/IMG_0236_vuooqg.jpg',
    alt_text: 'roof framed in wood for custom sunroom'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064169/M-Woodworks/Tuxedo%20Sunroom/IMG_0041_d42vhl.jpg',
    alt_text: 'framing sunroom extension to house'
  },
  {
    gallery_id: 7,
    image_url: 'https://res.cloudinary.com/excipio/image/upload/v1645064163/M-Woodworks/Tuxedo%20Sunroom/IMG_0461_grqrro.jpg',
    alt_text: 'framing rough-in for custom wood sunroom'
  }
  
])