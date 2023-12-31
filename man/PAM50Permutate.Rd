% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PAM50Permutate.R   
\docType{methods}
\name{permutate,PAM50-method}
\alias{permutate,PAM50-method}
\title{\code{permutate} subject gene-expression for PAM50 confidence}   
\usage{
\S4method{permutate}{PAM50}(object, nPerm = 10000, pCutoff = 0.01,  
    where = "fdr", keep = FALSE, corCutoff = 0.1, seed = 1234567890, 
    BPPARAM = bpparam(), verbose = getOption("verbose", default = TRUE))
}
\arguments{
\item{object}{a MolecularPermutationClassifier subclass object.} 

\item{nPerm}{integer with number of permutations. Default: 1e4L}  

\item{pCutoff}{numeric with p-value or fdr cutoff used, i.e., 
variable<pCutoff. Default: 0.01}  

\item{where}{character with significant value used. Default value is "fdr".}

\item{keep}{should null distribution simulation values be kept?.  
Default: FALSE}   

\item{corCutoff}{numeric with correlation difference between classes   
cutoff used, i.e.,  
\eqn{|\rho(profile, class_A)-\rho(profile, class_B)|>corCutoff}.  
Default 0.1}   

\item{seed}{integer to use as random seed. Default: 1234567890.} 

\item{BPPARAM}{an optional BiocParallelParam instance determining the   
parallel back-end to be used during evaluation, or a list of  
BiocParallelParam instances, to be applied in sequence for nested calls to  
bplapply. Default=bpparam().}   

\item{verbose}{should the user feedback be displayed? By default value is   
"verbose" global option parameter, if present, or FALSE otherwise.}
}
\value{
a PAM50 object with the following updated slots: 
\item{@permutation}{
        \describe{
            \item{$pvalues}{numeric matrix with subtype pvalues obtained as the 
            number of times the permuted correlation is greater or equal   
            the observed correlation divided the number of permutations.} 
            \item{$fdr}{subtype adjusted pvalues for each subject with False 
            Discovery Rate.}   
            \item{$correlations}{list with subject matrix correlation of each  
            permutation simulation.}   
            \item{$subtype}{data.frame with classification results 
                obtained by subtype function.}     
        }
}
\item{@parameters}{$nPerm, $pCutoff, $where and $keep updated accordingly.}  
}
\description{
Calculate the null Spearman's \eqn{\rho} distribution of each subtype by   
means of gene label permutation, in order to evaluate if the observed 
values could be obtained by random change.  
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
\references{
\enumerate{
        \item Haibe-Kains B, Schroeder M, Bontempi G, Sotiriou C and   
        Quackenbush J, 2014, genefu: Relevant Functions for Gene 
        Expression Analysis, Especially in Breast Cancer. R package 
        version 1.16.0, \url{www.pmgenomics.ca/bhklab/}  
        \item Perou CM, Sorlie T, Eisen MB, et al., 2000, Molecular portraits 
        of human breast tumors. Nature 406:747-752.   
        \item Perou CM, Parker JS, Prat A, Ellis MJ, Bernard PB., 2010, 
        Clinical implementation of the intrinsic subtypes of  
        breast cancer, The Lancet Oncology 11(8):718-719.   
}
}
\seealso{
\code{\link{PAM50}} for a complete example.

Other PAM50: \code{\link{as}},  
    \code{\link{classify,PAM50-method}},
    \code{\link{filtrate,PAM50-method}},
    \code{\link{pam50centroids}},
    \code{\link{subjectReport,PAM50-method}},
    \code{\link{subtypes,PAM50-method}}
}

