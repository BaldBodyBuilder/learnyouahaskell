import System.Environment
import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S



main = do
    (fileName1:fileName2:_) <- getArgs
    copyFile fileName1 fileName2

copyFile :: FilePath -> FilePath -> IO ()
copyFile source dest = do
 contents <- B.readFile source
 B.writeFile dest contents
-- Code to take two filenames as CL args and copy the first file into the second file