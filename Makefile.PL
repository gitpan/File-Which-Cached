use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'File::Which::Cached',
    VERSION_FROM      => 'lib/File/Which/Cached.pm', # finds $VERSION
    PREREQ_PM         => {
                'File::Which' => 0,
                'Benchmark::Timer' => 0,
                'Smart::Comments' => 0,
    },
);
