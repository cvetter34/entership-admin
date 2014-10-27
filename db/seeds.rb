Registrant.destroy_all
Member.destroy_all
Company.destroy_all
Job.destroy_all
App.destroy_all
Contact.destroy_all
Manager.destroy_all

managers = Manager.create([
  {
    name: "Bob Dole",
    email: "bob@dolepineapple.com",
    password: "1234",
    password_confirmation: "1234",
    is_director: true
  },
  {
    name: "Richard Nixon",
    email: "dick@tricky.com",
    password: "1234",
    password_confirmation: "1234",
    is_director: false
  },
  {
    name: "Suyin Anand",
    email: "suyinanand@gmail.com",
    password: "1234",
    password_confirmation: "1234",
    is_director: true
  },
  {
    name: "Andrew Oates",
    email: "andrew.oates12@gmail.com",
    password: "1234",
    password_confirmation: "1234",
    is_director: true
  }
])

registrants = Registrant.create([
  { email: "fannie@example.com" },
  { email: "gerald@example.com" },
  { email: "horton@example.com" }
])

members = Member.create([
  {
    name_given: "Suyin",
    name_family: "Anand",
    email: "suyinanand@gmail.com",
    password: "1234",
    born_on: Date.today - 25.years - 50.days,
    nationality_code: "SG",
    country_code: "HK",
    occupation: "Attorney",
    sectors: [
      Member.ok_sectors.values.sample,
      Member.ok_sectors.values.sample
    ].uniq,
    phone: "123 4567 8900",
    is_public: true,
    title: Member.ok_titles.values.sample,
    street_address: "Queen's Road Central, 299",
    city: "Hong Kong",
    postal_code: "444 333",
    will_relocate: true,
    current_status: Member.ok_statuses.values.sample,
    experience: Member.ok_experiences.values.sample,
    hide_born_on: true,
    hide_status: true
  },
  {
    name_given: "Andrew",
    name_family: "Oates",
    email: "andrew.oates12@gmail.com",
    password: "1234",
    born_on: Date.today - 23.years - 250.days,
    nationality_code: "GR",
    country_code: "HK",
    occupation: "Marketer",
    sectors: [
      Member.ok_sectors.values.sample,
      Member.ok_sectors.values.sample
    ].uniq,
    phone: "123 4567 8900",
    is_public: false,
    title: Member.ok_titles.values.sample,
    street_address: "Caine Road, 55-57",
    city: "Hong Kong",
    postal_code: "222 111",
    will_relocate: true,
    current_status: Member.ok_statuses.values.sample,
    experience: Member.ok_experiences.values.sample,
    hide_born_on: true,
    hide_status: false
  },
  {
    name_given: "Mick",
    name_family: "Jagger",
    email: "jagger@example.com",
    password: "1234",
    born_on: Date.today - 65.years - 175.days,
    nationality_code: "GB",
    country_code: "US",
    occupation: "Rocker",
    sectors: [
      Member.ok_sectors.values.sample
    ],
    phone: "123 4567 8900",
    is_public: true,
    title: Member.ok_titles.values.sample,
    street_address: "1600 Pennsylvania Ave",
    city: "Washington",
    postal_code: "10101",
    will_relocate: false,
    current_status: Member.ok_statuses.values.sample,
    experience: Member.ok_experiences.values.sample,
    hide_born_on: false,
    hide_status: true
  },
  {
    name_given: "David",
    name_family: "Bowie",
    email: "bowie@example.com",
    password: "1234",
    born_on: Date.today - 62.years - 26.days,
    nationality_code: "GB",
    country_code: "GB",
    occupation: "Glamboy",
    sectors: [
      Member.ok_sectors.values.sample,
      Member.ok_sectors.values.sample,
      Member.ok_sectors.values.sample
    ].uniq,
    phone: "123 4567 8900",
    is_public: false,
    title: Member.ok_titles.values.sample,
    street_address: "Buckingham Palace",
    city: "London",
    postal_code: "HRH 001",
    will_relocate: false,
    current_status: Member.ok_statuses.values.sample,
    experience: Member.ok_experiences.values.sample,
    hide_born_on: false,
    hide_status: false
  },
  {
    name_given: "Elvis",
    name_family: "Presley",
    email: "presley@example.com",
    password: "1234",
    born_on: Date.today - 77.years - 150.days,
    nationality_code: "US",
    country_code: "US",
    occupation: "Shaker",
    sectors: [
      Member.ok_sectors.values.sample,
      Member.ok_sectors.values.sample,
      Member.ok_sectors.values.sample
    ].uniq,
    phone: "123 4567 8900",
    is_public: true,
    title: Member.ok_titles.values.sample,
    street_address: "100 Chantilly Lane",
    city: "Memphis",
    postal_code: "43210",
    will_relocate: true,
    current_status: Member.ok_statuses.values.sample,
    experience: Member.ok_experiences.values.sample,
    hide_born_on: true,
    hide_status: false
  },
  {
    name_given: "Frank",
    name_family: "Sinatra",
    email: "sinatra@example.com",
    password: "1234",
    born_on: Date.today - 77.years - 150.days,
    nationality_code: "US",
    country_code: "US",
    occupation: "Shaker",
    sectors: [
      Member.ok_sectors.values.sample,
      Member.ok_sectors.values.sample
    ].uniq,
    phone: "123 4567 8900",
    is_public: true,
    title: Member.ok_titles.values.sample,
    street_address: "77 Pearly Gates",
    city: "Heaven",
    postal_code: "1",
    will_relocate: false,
    current_status: Member.ok_statuses.values.sample,
    experience: Member.ok_experiences.values.sample,
    hide_born_on: false,
    hide_status: true
  },
  {
    name_given: "Charles",
    name_family: "example",
    email: "charles.example@gmail.com",
    password: "1234",
    born_on: Date.today - 55.years - 150.days,
    nationality_code: "US",
    country_code: "US",
    occupation: "Coder",
    sectors: [
      Member.ok_sectors.values.sample,
      Member.ok_sectors.values.sample
    ].uniq,
    phone: "123 4567 8900",
    is_public: false,
    title: Member.ok_titles.values.sample,
    street_address: "33 Peyton Place",
    city: "Los Angeles",
    postal_code: "90210",
    will_relocate: false,
    current_status: Member.ok_statuses.values.sample,
    experience: Member.ok_experiences.values.sample,
    mobile: "+852 9176 1096",
    website_url: "charlesexample.info",
    hide_born_on: false,
    hide_status: false
  }
])

companies = Company.create([
  {
    name: "China Navigation",
    package: Company.ok_packages.values.sample,
    email: "chinanav@example.com",
    password: "1234",
    address: "The China Navigation Co Pte. Ltd.\n300 Beach Road #27-01\nThe Concourse Singapore 199555",
    country_code: "SG",
    sectors: [
      Company.ok_sectors.values.sample
    ],
    contact_person: "Yuwen Fa",
    website_url: "www.chinanav.com",
    description: %{
      The China Navigation Company is the wholly owned, deep-sea ship owning
      and operating arm of the Swire group. The company operates a global
      network of multi-purpose liner services, dry bulk and bulk logistics
      services through its three business divisions: Swire Shipping, Swire
      Bulk, and Swire Bulk Logistics.
    }.squish,
    contact_email: "enquiry@chinanav.com",
    phone: "+65 6603 9400",
    year_founded: 2001,
    logo: File.open("db/images/china-navigation.png"),
    is_vetted: true,
    company_type: Company.ok_company_types.values.sample,
    company_size: Company.ok_company_sizes.values.sample
  },
  {
    name: "Orient Overseas Container Line Limited",
    package: Company.ok_packages.values.sample,
    email: "oocl@example.com",
    password: "1234",
    address: "31/F, Harbour Centre 25 Harbour Road Wanchai Hong Kong",
    country_code: "HK",
    sectors: [
      Company.ok_sectors.values.sample,
      Company.ok_sectors.values.sample
    ],
    contact_person: "Mark Li",
    website_url: "www.oocl.com",
    description: %{
      OOCL is well respected in the industry with a reputation for providing
      customer-focused solutions, a quality-through-excellence approach and
      continual innovation.  OOCL is one of the leading international carriers
      serving China, providing a full range of logistics and transportation
      services throughout the country. It is also an industry leader in the use
      of information technology and e-commerce to manage the entire cargo
      process.
    }.squish,
    contact_email: "info@oocl.com",
    phone: "(852) 2833 3888",
    year_founded: 1880,
    logo: File.open("db/images/oocl.jpg"),
    is_vetted: true,
    company_type: Company.ok_company_types.values.sample,
    company_size: Company.ok_company_sizes.values.sample
  },
  {
    name: "Crowley Maritime",
    package: Company.ok_packages.values.sample,
    email: "crowley@example.com",
    password: "1234",
    address: "9487 Regency Square Blvd.\nJacksonville, FL 32225",
    country_code: "US",
    sectors: [
      Company.ok_sectors.values.sample
    ],
    contact_person: "Tom Jones",
    website_url: "www.crowley.com",
    description: %{
      Crowley Maritime is one of the oldest, most accomplished maritime
      companies in the world. For over 100 years, we have been operating our
      own marine equipment and enterprises while serving the needs of the larger
      maritime industry.
    }.squish,
    contact_email: "admin@crowley.com",
    phone: "1-800-276-9539",
    year_founded: 1950,
    logo: File.open("db/images/crowley.png"),
    is_vetted: true,
    company_type: Company.ok_company_types.values.sample,
    company_size: Company.ok_company_sizes.values.sample
  },
  {
    name: "MAERSK",
    package: Company.ok_packages.values.sample,
    email: "maersk@example.com",
    password: "1234",
    address: "A.P. Møller - Mærsk A/S\nEsplanaden 50\n1098 Copenhagen K\nDenmark",
    country_code: "DK",
    sectors: [
      Company.ok_sectors.values.sample,
      Company.ok_sectors.values.sample
    ],
    contact_person: "Jürgen Leth",
    website_url: "www.maersk.com",
    description: %{
      The largest operating unit in A.P. Moller – Maersk by revenue and staff
      (around 25,000 employees in 2012) is Maersk Line. We are the world's
      largest overseas cargo carrier and operated over 600 vessels with 3.8
      million Twenty-foot equivalent unit (TEU) container capacity.
    }.squish,
    contact_email: "jobs@maersk.com",
    phone: "+45 33 63 33 63",
    fax: "+45 33 63 41 08",
    year_founded: 1750,
    logo: File.open("db/images/maersk.jpg"),
    is_vetted: true,
    company_type: Company.ok_company_types.values.sample,
    company_size: Company.ok_company_sizes.values.sample
  },
  {
    name: "Hamburg Süd",
    package: Company.ok_packages.values.sample,
    email: "hamburgsud@example.com",
    password: "1234",
    address: "Willy-Brandt-Str. 59-61\nHamburg 20457",
    country_code: "DE",
    sectors: [
      Company.ok_sectors.values.sample
    ],
    contact_person: "Wilhelm Smith",
    website_url: "www.hamburg-sued.com",
    description: %{
      Since its formation in 1871, Hamburg Süd has evolved from a conventional
      shipping company into a globally operating transport logistics
      organisation. Today, it ranks among the world's 20 largest container
      shipping lines and is one of the leading providers in the North-South
      trades.
    }.squish,
    contact_email: "prinfo@hamburgsud.com",
    phone: "+49 (0)40 3705 0",
    fax: "+49 (0)40 3705 2649",
    logo: File.open("db/images/hamburg-sud.jpg"),
    company_type: Company.ok_company_types.values.sample,
    company_size: Company.ok_company_sizes.values.sample
  }
])

jobs = Job.create([
  {
    title: "Demurrage Executive",
    company: companies[0],
    email: companies[0].email,
    is_verified: true,
    description: %{
      As a Demurrage Executive, he/ she should have strong analytical skills to
      manage data of reports. He/ She will be required to calculate demurrage
      claims, freight, time charter(in/out) and not limited to other claims
      which may be associated with vessel employment. Payments must be processed
      by this candidate and also to generate monthly reports.
    }.squish,
    responsibilities: %{
      Fusce convallis metus id felis luctus adipiscing. Donec sodales sagittis
      magna. Pellentesque auctor neque nec urna. Morbi mattis ullamcorper velit.
    }.squish,
    ideal_candidate: %{
      Fusce egestas elit eget lorem. Phasellus blandit leo ut odio. Ut leo.
      Ut tincidunt tincidunt erat.
    }.squish,
    sector: Member.ok_sectors.values.sample,
    contract_type: Job.ok_contract_types.values.sample,
    experience_level: Job.ok_experience_levels.values.sample,
    country_code: "SG",
    salary: Money.new(5000000, "USD"),
    salary_frequency: "year",
    contact_person: "Livvy Hong",
    posted_on: Date.today,
    deadline_on: Date.today + 90.days,
    city: "Singapore",
    postal_code: "012 345"
  },
  {
    title: "Marine Estimator",
    company: companies[0],
    email: companies[0].email,
    is_verified: false,
    description: %{
      Faststream Recruitment is the global leader in Maritime staffing and
      recruitment providing our clients with permanent, temporary and project
      based solutions. Faststream employs of a team of 130 globally with
      operations in UK, Singapore, and in the U.S., Texas and Florida.
      Faststream has partnered with a top client in the Maritime Industry.
      They are searching for a Marine Electrical Estimator. Salary from $65-80k.
    }.squish,
    responsibilities: %{
      Fusce convallis metus id felis luctus adipiscing. Donec sodales sagittis
      magna. Pellentesque auctor neque nec urna. Morbi mattis ullamcorper velit.
    }.squish,
    ideal_candidate: %{
      Fusce egestas elit eget lorem. Phasellus blandit leo ut odio. Ut leo.
      Ut tincidunt tincidunt erat.
    }.squish,
    sector: Member.ok_sectors.values.sample,
    contract_type: Job.ok_contract_types.values.sample,
    experience_level: Job.ok_experience_levels.values.sample,
    country_code: "US",
    salary: Money.new(6000000, "USD"),
    salary_frequency: "year",
    contact_person: "Jennifer Navarro",
    posted_on: Date.today,
    deadline_on: Date.today + 180.days,
    city: "Los Angeles",
    postal_code: "90210"
  },
  {
    title: "National Sales Manager - Thailand (Permanent)",
    company: companies[3],
    email: companies[3].email,
    is_verified: true,
    description: %{
      Our client, a multinational player in the Freight Forwarding/3PL industry,
      is looking for a National Sales Manager to head up their Thai Sales Team
      in Bangkok. As National Sales Manager you will be responsible for business
      development/sales with clients in the target market as well as preparing
      tenders. Furthermore, you will be responsible for managing and mentoring
      a the local sales team and you will be responsible for the overall sales
      targets in Thailand.
    }.squish,
    responsibilities: %{
      Fusce convallis metus id felis luctus adipiscing. Donec sodales sagittis
      magna. Pellentesque auctor neque nec urna. Morbi mattis ullamcorper velit.
    }.squish,
    ideal_candidate: %{
      Fusce egestas elit eget lorem. Phasellus blandit leo ut odio. Ut leo.
      Ut tincidunt tincidunt erat.
    }.squish,
    sector: Member.ok_sectors.values.sample,
    contract_type: Job.ok_contract_types.values.sample,
    experience_level: Job.ok_experience_levels.values.sample,
    country_code: "TH",
    salary: Money.new(6000000, "USD"),
    contact_person: "Stine Martinussen",
    posted_on: Date.today + 14.days,
    deadline_on: Date.today + 28.days,
    city: "Bangkok",
    postal_code: "666 999",
    job_reference: "bzlbub"
  },
  {
    title: "Chief Engineer - ERRV",
    company: companies[2],
    email: companies[2].email,
    is_verified: true,
    description: %{
      I am currently recruiting for 2 x Chief Engineers to work on an ERRV in
      the North Sea. This is a permanent role with an annual salary around
      £36500. Previous experience sailing in rank is essential. UK COC/CEC is
      preferred. Right to work in the UK is required.
    }.squish,
    responsibilities: %{
      Fusce convallis metus id felis luctus adipiscing. Donec sodales sagittis
      magna. Pellentesque auctor neque nec urna. Morbi mattis ullamcorper velit.
    }.squish,
    ideal_candidate: %{
      Fusce egestas elit eget lorem. Phasellus blandit leo ut odio. Ut leo.
      Ut tincidunt tincidunt erat.
    }.squish,
    sector: Member.ok_sectors.values.sample,
    contract_type: Job.ok_contract_types.values.sample,
    experience_level: Job.ok_experience_levels.values.sample,
    country_code: "GB",
    salary: Money.new(3650000, "GBP"),
    salary_frequency: "year",
    contact_person: "Ian Low",
    posted_on: Date.today,
    deadline_on: Date.today + 60.days,
    city: "Liverpool",
    postal_code: "C3P 0D2",
    job_reference: "88812"
  },
  {
    title: "Vessel Operator (Permanent)",
    company: companies[3],
    email: companies[3].email,
    is_verified: true,
    description: %{
      Faststream Recruitment is the global leader in Maritime staffing and
      recruitment providing our clients with permanent, temporary and project
      based solutions. Faststream employs of a team of 130 globally with
      operations in UK, Singapore, and in the U.S., Texas and Florida.
      Faststream has partnered with a worldwide leader in the Shipping
      community operating a fleet of Chemical Tankers. They are searching
      for a Vessel Operator to be responsible for coordinating the day to
      day operational activities of voyage and time chartered tankers. This
      exciting opportunity has excellent base salary and great benefits!
    }.squish,
    responsibilities: %{
      Fusce convallis metus id felis luctus adipiscing. Donec sodales sagittis
      magna. Pellentesque auctor neque nec urna. Morbi mattis ullamcorper velit.
    }.squish,
    ideal_candidate: %{
      Fusce egestas elit eget lorem. Phasellus blandit leo ut odio. Ut leo.
      Ut tincidunt tincidunt erat.
    }.squish,
    sector: Member.ok_sectors.values.sample,
    contract_type: Job.ok_contract_types.values.sample,
    experience_level: Job.ok_experience_levels.values.sample,
    country_code: "US",
    salary: Money.new(10000000, "USD"),
    salary_frequency: "year",
    contact_person: "Brad McCoy",
    posted_on: Date.today,
    deadline_on: Date.today + 30.days,
    city: "Seattle",
    postal_code: "98105",
    job_reference: "x7vv5r"
  }
])

apps = App.create([
  {
    member: members[3],
    job: jobs[0],
    name_given: members[3].name_given,
    name_family: members[3].name_family,
    age: members[3].age,
    nationality_code: members[3].nationality_code,
    country_code: members[3].country_code,
    phone: members[3].phone,
    email: members[3].email,
    has_right_to_work: true,
    status: 1,
    personal_statement: "This is the cover letter for #{members[3].name} and #{jobs[0].title}."
  },
  {
    member: members[3],
    job: jobs[1],
    name_given: members[3].name_given,
    name_family: members[3].name_family,
    age: members[3].age,
    nationality_code: members[3].nationality_code,
    country_code: members[3].country_code,
    phone: members[3].phone,
    email: members[3].email,
    has_right_to_work: true,
    status: 2,
    personal_statement: "This is the cover letter for #{members[3].name} and #{jobs[1].title}."
  },
  {
    member: members[3],
    job: jobs[3],
    name_given: members[3].name_given,
    name_family: members[3].name_family,
    age: members[3].age,
    nationality_code: members[3].nationality_code,
    country_code: members[3].country_code,
    phone: members[3].phone,
    email: members[3].email,
    has_right_to_work: true,
    status: 0,
    personal_statement: "This is the cover letter for #{members[3].name} and #{jobs[3].title}."
  },
  {
    member: members[4],
    job: jobs[3],
    name_given: members[4].name_given,
    name_family: members[4].name_family,
    age: members[4].age,
    nationality_code: members[4].nationality_code,
    country_code: members[4].country_code,
    phone: members[4].phone,
    email: members[4].email,
    has_right_to_work: true,
    status: 2,
    personal_statement: "This is the cover letter for #{members[4].name} and #{jobs[3].title}."
  },
  {
    member: members[0],
    job: jobs[3],
    name_given: members[0].name_given,
    name_family: members[0].name_family,
    age: members[0].age,
    nationality_code: members[0].nationality_code,
    country_code: members[0].country_code,
    phone: members[0].phone,
    email: members[0].email,
    has_right_to_work: true,
    status: 0,
    personal_statement: "This is the cover letter for #{members[0].name} and #{jobs[3].title}."
  },
  {
    member: members[1],
    job: jobs[3],
    name_given: members[1].name_given,
    name_family: members[1].name_family,
    age: members[1].age,
    nationality_code: members[1].nationality_code,
    country_code: members[1].country_code,
    phone: members[1].phone,
    email: members[1].email,
    has_right_to_work: true,
    status: 1,
    personal_statement: "This is the cover letter for #{members[1].name} and #{jobs[3].title}."
  },
  {
    member: members[1],
    job: jobs[4],
    name_given: members[1].name_given,
    name_family: members[1].name_family,
    age: members[1].age,
    nationality_code: members[1].nationality_code,
    country_code: members[1].country_code,
    phone: members[1].phone,
    email: members[1].email,
    has_right_to_work: true,
    status: 2,
    personal_statement: "This is the cover letter for #{members[1].name} and #{jobs[4].title}."
  },
  {
    member: members[2],
    job: jobs[4],
    name_given: members[2].name_given,
    name_family: members[2].name_family,
    age: members[2].age,
    nationality_code: members[2].nationality_code,
    country_code: members[2].country_code,
    phone: members[2].phone,
    email: members[2].email,
    has_right_to_work: true,
    status: 1,
    personal_statement: "This is the cover letter for #{members[2].name} and #{jobs[4].title}."
  }
])
