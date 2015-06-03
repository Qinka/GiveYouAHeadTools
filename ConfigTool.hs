module GYAHTool
    (createNewPackage)

    where
import System.IO
import System.Directory
import System.Environment

createNewPackage    ::  String
                    ->  String
                    ->  String
                    ->  String
                    ->  String
                    ->    IO ()

createNewPackage
    packageName                     --String
    version                         --String
    license                         --String
    description                     --String
    author                          --String
    = do
    createDirectory packageName
    writeFile ( packageName ++ "/" ++ packageName ++ ".cabal") (
        concat  [
            "name: " , packageName ,"\n",
            "version: ",version,"\n",
            "cabal-version: 1.2\nbuild-type: Custom\n",
            "license: ",license,"\n",
            "description: ",description,"\n",
            "author: ",author,"\n",
            "library \n    ghc-options: -Wall\n",
            "    build-depends:",
            "        GiveYouAHead"
            ]
        )
    writeFile (packageName ++ "/Setup.hs") (
        concat [
                "import Distribution.Simple\nimport System.IO\nimport System.Directory\nmain = do\n    --your\n    \n    --your end\n    defaultMain\n"
               ]

        )

