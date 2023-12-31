% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MolecularPermutationClassifierGenerics.R   
\docType{methods}
\name{filtrate}
\alias{classify}
\alias{classify-methods}
\alias{databaseReport}
\alias{databaseReport-methods}
\alias{filtrate}
\alias{filtrate-methods}
\alias{permutate}
\alias{permutate-methods}
\alias{subjectReport}
\alias{subjectReport-methods}
\alias{subtypes}
\alias{subtypes-methods}
\title{Virtual functions for MolecularPermutationClassifier hierarchy}
\usage{
filtrate(object, verbose = getOption("verbose", default = FALSE))  

classify(object, ..., verbose = getOption("verbose", default = FALSE)) 

permutate(object, nPerm = 10000L, pCutoff = 0.01, where = "fdr",   
    keep = FALSE, ..., seed = 1234567890, BPPARAM = bpparam(),   
    verbose = getOption("verbose", default = TRUE))   

subtypes(object, pCutoff = 0.01, ..., where = c("fdr", "pvalue")[1])

subjectReport(object, subject)   

databaseReport(object, fileName, ..., verbose = getOption("verbose", default = 
    TRUE))
}
\arguments{
\item{object}{MolecularPermutationClassifier child class object} 

\item{verbose}{should the user feedback be displayed? By default value
is "verbose" global option parameter, if present, or FALSE otherwise.}   

\item{...}{additional parameters for future implementations.}

\item{nPerm}{integer with number of permutations. Default: 1e4L.}  

\item{pCutoff}{numeric with p-value or fdr cutoff used, i.e., 
variable<pCutoff. Default: 0.01.}  

\item{where}{character with significant value used. Default value is "fdr".}

\item{keep}{should null distribution simulation values be kept?.  
Default: FALSE}   

\item{seed}{integer to use as random seed. Default: 1234567890.} 

\item{BPPARAM}{an optional BiocParallelParam instance determining the   
parallel back-end to be used during evaluation, or a list of  
BiocParallelParam instances, to be applied in sequence for nested calls to  
bplapply. Default=bpparam().}   

\item{subject}{integer to select the appropriate subject to report.} 

\item{fileName}{character with the name of the pdf report file to save.}  
}
\value{
A MolecularPermutationClassifier child according to the actual  
object class.   
}
\description{
The following functions establish an organized framework for 
MolecularPermutationClassifier subclasses data processing. In this context,  
the later are supposed to be implemented with respective responsibilities.   
In particular, once the class is created the user has to:  
\describe{
        \item{filtrate:}{Removes, from the exprs matrix, subjects not required 
        by the classification algorithm.} 
        \item{classify:}{Generates subject classification according to
        subclass implementations (PAM50, etc.).} 
        \item{permute:}{Obtains subject classification based on the null  
        correlation distribution by means permutation simulation.}   
        \item{subtype:}{Obtaind the new classification using permutation   
        results.}
        \item{subjectReport:}{A friendly report for physician treatment   
        decision support.}   
        \item{databaseReport:}{A pdf with all subjectReports, if a database is
        available.}
}
}
\examples{
##Using pam50centroids package example data
data(pam50centroids)
pam50centroids
pam50centroids<-filtrate(pam50centroids, verbose=TRUE)   
pam50centroids<-classify(pam50centroids, std="none", verbose=TRUE)  
##Let's run a quick example with 100 permutations. It is recommended at 
##least 10.000   
pam50centroids<-permutate(pam50centroids, nPerm=100, pCutoff=0.01,  
corCutoff=0.1, verbose=TRUE)   
pam50centroids

}
\author{
Cristobal Fresno \email{cfresno@bdmg.com.ar}, German A. Gonzalez   
        \email{ggonzalez@bdmg.com.ar}, Andrea S. Llera 
        \email{allera@leloir.org.ar} and Elmer Andres Fernandez    
        \email{efernandez@bdmg.com.ar}
}
\seealso{
\code{\link{PAM50}} for a complete example.

Other MolecularPermutationClassifier PAM50: \code{\link{PAM50-class}}, 
    \code{\link{loadBCDataset}}
}

