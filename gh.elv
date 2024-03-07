# gh.elv - wrapper for gh command and library of utility functions



fn search {|&query


gh search repos yazi -L1 --json owner,name -q '.[]|{owner: .owner.login, repo: .name}|[.owner,.repo]|@tsv'
