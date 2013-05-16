powershell-profile
==================

My powershell profile, placed in github for easy access

Many thanks to David Mohundro (https://github.com/drmohundro) for his inspiring talk at NWADNUG, and for providing his powershell profile on github--which has provided many good examples that helped me learn, and lots of working code that I have used as-is.

---

To create a symlink so that the powershell $profile directory points to the local copy of this repository...

	mklink /D c:\Users\username\Documents\WindowsPowerShell powershell-profile

Assuming the command above was run from the command line (not powershell) and the current directory is the parent directory of the local copy of this repository.

Note that you can't commit from the symlink directory, you must be in the actual local copy.  However, powershell treats it as the profile directory just fine

---

