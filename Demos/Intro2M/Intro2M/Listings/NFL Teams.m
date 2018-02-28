﻿let
  output = 
    #table(type table 
      [ Team = text, Division = text, Conference = text, City = text, RosterUrl = text, LogoUrl = text],
      {                               
        { "Bills", "AFC-East", "AFC","Buffalo, NY", "http://www.buffalobills.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/bills-logo.png" },
        { "Dolphins", "AFC-East", "AFC","Miami, FL", "http://www.miamidolphins.com/team/player-roster.html", "https://cpt.azureedge.net/TeamLogoImages/dolphins-logo.png" },
        { "Jets", "AFC-East", "AFC", "East Rutherford, NJ", "http://www.newyorkjets.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/jets-logo.png" },
        { "Patriots", "AFC-East", "AFC", "Foxboro, MA", "http://www.patriots.com/team/roster", "https://cpt.azureedge.net/TeamLogoImages/patriots-logo.png" },
        { "Bengals", "AFC-North" , "AFC","Cincinnati, OH","http://www.bengals.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/bengals-logo.png" },
        { "Browns", "AFC-North" , "AFC" ,"Cleveland, OH","http://www.clevelandbrowns.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/browns-logo.png" },
        { "Ravens", "AFC-North", "AFC","Baltimore, MD", "http://www.baltimoreravens.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/ravens-logo.png" },
        { "Steelers", "AFC-North", "AFC", "Pittsburg, PA", "http://www.steelers.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/steelers-logo.png" },
        { "Colts" , "AFC-South" , "AFC","Indianapolis, IN", "http://www.colts.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/colts-logo.png" },
        { "Jaguars", "AFC-South", "AFC", "Jacksonville, FK", "http://www.jaguars.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/jaguars-logo.png" },
        { "Texans", "AFC-South", "AFC", "Houston, TX", "http://www.houstontexans.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/texans-logo.png" },
        { "Titans", "AFC-South", "AFC", "Nashville, TN", "http://www.titansonline.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/titans-logo.png" },
        { "Broncos", "AFC-West" , "AFC", "Denver, CO", "http://www.denverbroncos.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/broncos-logo.png" },
        { "Chargers", "AFC-West", "AFC", "San Diego, CA", "http://www.chargers.com/team/roster", "https://cpt.azureedge.net/TeamLogoImages/chargers-logo.png" },
        { "Chiefs", "AFC-West", "AFC","Kansas City, MO", "http://www.chiefs.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/chiefs-logo.png" },
        { "Raiders", "AFC-West", "AFC","Oakland, CA", "http://www.raiders.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/raiders-logo.png" },
        { "Eagles" , "NFC-East", "NFC", "Philadelphia, PA", "http://www.philadelphiaeagles.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/eagles-logo.png" },
        { "Giants", "NFC-East", "NFC", "East Rutherford, NJ", "http://www.giants.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/giants-logo.png" },
        { "Redskins", "NFC-East", "NFC", "Washington, DC", "http://www.redskins.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/redskins-logo.png" },
        { "Cowboys", "NFC-East", "NFC","Dallas, TX", "http://www.dallascowboys.com/team/roster", "https://cpt.azureedge.net/TeamLogoImages/cowboys-logo.png" },
        { "Bears", "NFC-North", "NFC", "Chicago, IL", "http://www.chicagobears.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/bears-logo.png" },
        { "Lions", "NFC-North", "NFC", "Detroit, MI", "http://www.detroitlions.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/lions-logo.png" },
        { "Packers", "NFC-North", "NFC","Green Bay, WI", "http://www.packers.com/team/players.html", "https://cpt.azureedge.net/TeamLogoImages/packers-logo.png" },
        { "Vikings", "NFC-North", "NFC", "Minneapolis , MN", "http://www.vikings.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/vikings-logo.png" },
        { "Buccaneers", "NFC-South", "NFC", "Tampa, FL", "http://www.buccaneers.com/team-and-stats/roster.html", "https://cpt.azureedge.net/TeamLogoImages/bucs-logo.png" },
        { "Falcons", "NFC-South", "NFC", "Atlanta, GA", "http://www.atlantafalcons.com/team/player-roster.html", "https://cpt.azureedge.net/TeamLogoImages/falcons-logo.png" },
        { "Panthers", "NFC-South", "NFC", "Charlotte, NC", "http://www.panthers.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/panthers-logo.png" },
        { "Saints", "NFC-South", "NFC", "New Orleans, LA", "http://www.neworleanssaints.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/saints-logo.png" },
        { "49ers", "NFC-West", "NFC", "San Francisco, CA", "http://www.49ers.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/49ers-logo.png" },
        { "Cardinals", "NFC-West", "NFC", "Glendale, AZ", "http://www.azcardinals.com/roster/player-roster.html", "https://cpt.azureedge.net/TeamLogoImages/cardinals-logo.png" },
        { "Rams", "NFC-West", "NFC", "St. Louis, MO", "http://www.therams.com/team/roster.html", "https://cpt.azureedge.net/TeamLogoImages/rams-logo.png" },
        {"Seahawks","NFC-West", "NFC","Seattle, WA", "http://www.seahawks.com/team/roster", "https://cpt.azureedge.net/TeamLogoImages/seahawks-logo.png" }
      }
    )
in 
  output