Status.create(text: "Active")
Framework.create(name: "Custom")
Blockchain.create(name: "Ethereum")
dao = Dao.create(
  name: "MolochDAO",
  subtitle: "A community DAO focused on funding Ethereum dev",
  website: "https://molochdao.com/",
  description: "A community DAO focused on funding Ethereum development, in the name of Moloch the God of Coordination Failure.",
  contract_proof: "https://twitter.com/MolochDAO/status/1121203264316268544",
  github: "https://github.com/MolochVentures",
  twitter: "MolochDAO",
  medium: "https://medium.com/molochdao",
  assets_governed: "The community decides that members to accept, in what proposals to work on and how to spend the crypto funds controlled by the DAO.",
  decentralization_level: "Fully Decentralized",
  centralization_points: "None",
  status_id: 1,
  framework_id: 1,
  blockchain_id: 1
)
Contract.create([
  {
    name: "Moloch",
    address: "0x1fd169a4f5c59acf79d0fd5d91d1201ef1bce9f1",
    description: "The main contract for the DAO",
    dao_id: 1
  },
  {
    name: "GuildBank",
    address: "0x211a94468ba1e379236b45ca42dc63ee93139c7e",
    description: "Contains all the funds for the DAO",
    dao_id: 1
  }
])
Auditor.create(name: "Nomic Labs", website: "https://nomiclabs.io/")
Audit.create(
  url: "https://medium.com/nomic-labs-blog/moloch-dao-audit-report-f31505e85c70",
  date: "14/02/2019",
  auditor_id: 1,
  dao_id: 1
)
Document.create(
  title: "Whitepaper",
  url: "https://github.com/MolochVentures/Whitepaper/blob/master/Whitepaper.pdf",
  dao_id: 1
)
Article.create(
  title: "The Moloch DAO: Collapsing The Firm.",
  url: "https://medium.com/@simondlr/the-moloch-dao-collapsing-the-firm-2a800b3aa2e7",
  date: "16/01/2019",
  dao_id: 1
)
Podcast.create([
    {
      title: "MolochDAO: Could This Decentralized Autonomous Organization Help Ethereum Scale Faster?",
      url: "https://unchainedpodcast.com/molochdao-could-this-decentralized-autonomous-organization-help-ethereum-scale-faster/",
      date: "19/03/2019",
      dao_id: 1
    },
    {
      title: "MolochDAO and Ethereum Clients",
      url: "https://www.stitcher.com/podcast/anchor-podcasts/membranlabs/e/58553712",
      date: "03/02/2019",
      dao_id: 1
    },
    {
      title: "Ameen Soleimani: Moloch DAO – A Simple Yet Unforgiving DAO to Fund Ethereum Development (#297)",
      url: "https://www.youtube.com/watch?v=YgEXImQLoq4",
      date: "24/07/2019",
      dao_id: 1
    }
])
dao.tags.create([
  {
    name: "funding"
  },
  {
    name: "eth 2.0"
  }
])
dao.contributors.create([
  {
    name: "Ameen Soleimani",
    twitter: "ameensol",
  },
  {
    name: "James Young",
    twitter: "jamesyoung",
  },
  {
    name: "Rahul Sethuram",
    twitter: "RHLSTHRM",
  },
  {
    name: "Layne Haber",
    twitter: "LayneHaber",
  },
  {
    name: "Arjun Bhuptani",
    twitter: "Arjun_Bhuptani",
  }
])
dao.image.attach(io: File.open(Rails.root.join('public', 'moloch.png')), filename: 'moloch.png')
