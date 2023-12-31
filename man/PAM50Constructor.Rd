% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PAM50Constructor.R   
\docType{methods}
\name{as}
\alias{as}
\alias{as.PAM50}
\alias{as.PAM50,MAList-method}
\alias{as.PAM50-methods}
\title{\code{PAM50} high level coerce functions}
\usage{
as(object,Class,strict=TRUE,ext=possibleExtends(thisClass,Class))

as.PAM50(object)

\S4method{as.PAM50}{MAList}(object)
}
\arguments{
\item{object}{MAList object with at least M and genes items, optionally   
targets.}

\item{Class}{character with the name of class "PAM50" to be coerced.}   

\item{strict, ext}{see \code{\link{as}} function.} 
}
\value{
a PAM50 object with the respective copied data. 
}
\description{
These functions (setAs and as.PAM50) are intended to be used with limma 
\code{\link{MAList-class}} in order to coerce its structure into a    
compatible PAM50 class.  
}
\details{
Basically the $M and $genes items are copied into a   
MolecularPermutationClassifier's exprs and annotation slots respectively.   
In addition, if present, $targets content is also copied to the same named
slot.
}
\examples{
##Example 1: Create a PAM50 object -----------------------------------------  
##1) Just an empty object
object<-PAM50()
object

##2) Using Breast Cancer NKI database, if available. 
if(requireNamespace("breastCancerNKI")){
    object<-loadBCDataset(Class=PAM50, libname="nki", verbose=TRUE)  
    object    
    ##Now we can inspect the object   
    head(exprs(object))      ##The gene expression    
    head(annotation(object)) ##The available annotation 
    head(targets(object))    ##The clinical data present in the package  
}

##Example 2: Build a PAM50 object with user data --------------------------   
##Option 1: using PAM50 constructor. The user will only need:   
##a) The M gene expression object, i. e., gene in rows and sample in columns  
##b) The annotation data.frame which must include the compulsory fields   
## "probe", "NCBI.gene.symbol" and "EntrezGene.ID"
M<-pam50$centroids
genes<-pam50$centroids.map
names(genes)<-c("probe", "NCBI.gene.symbol", "EntrezGene.ID")  
object<-PAM50(exprs=M, annotation=genes)   
object

##Option 2: Two ways to build it from a MAList (as or as.PAM50)-------------
##Let's use PAM50 classifier's centroids toy example, i. e., the five subject 
##subtypes, which must correctly classify all the subject. 
M<-pam50$centroids
genes<-pam50$centroids.map
names(genes)<-c("probe", "NCBI.gene.symbol", "EntrezGene.ID")  
maux<-new("MAList", list(M=M, genes=genes))  
##calling as function  
object<-as(maux, "PAM50")   
object
##same result with as.PAM50 function
object<-as.PAM50(maux)
object

}
\author{
Cristobal Fresno \email{cfresno@bdmg.com.ar}, German A. Gonzalez   
        \email{ggonzalez@bdmg.com.ar}, Andrea S. Llera 
        \email{allera@leloir.org.ar} and Elmer Andres Fernandez
        \email{efernandez@bdmg.com.ar}
}
\seealso{
\code{\link{PAM50}} for a complete example.

Other PAM50: \code{\link{classify,PAM50-method}},  
    \code{\link{filtrate,PAM50-method}},
    \code{\link{pam50centroids}},
    \code{\link{permutate,PAM50-method}},
    \code{\link{subjectReport,PAM50-method}},
    \code{\link{subtypes,PAM50-method}}
}

