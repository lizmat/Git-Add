unit class Git::Add;

has IO() $.directory = $*CWD.absolute;
has str  @.added is built(False);

submethod TWEAK(Mu :$add) {
    if $add {
        @!added.append: |$add if $add;
        indir $!directory, { run <git add>, @!added }
    }
}

method gist() {
    my str @parts;
    if @!added {
        @parts.push: "Added:";
        @parts.push: "  $_" for @!added;
        @parts.push: "";
    }
    
    @parts.prepend: self.^name ~ ":", "  $!directory", "" if @parts;

    @parts.join: "\n"
}

# vim: expandtab shiftwidth=4
