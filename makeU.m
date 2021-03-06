function U=makeU(u,M,d)
% U=makeU(u,M,d)
% --------------
% Generates the N x (pM+1)^d matrix U in the matrix equation Y=U*reshape(V,[l,p*M+1])' 
% for the identification of a p-input-l-output Volterra system, where V
% is the MIMO Volterra tensor and N=size(u,1) is the number of measured samples.
%
% U 	=   matrix, N x (pM+1)^d matrix U such that Y=U*reshape(V,[l,p*M+1])',
%
% u     =   matrix, u(:,k) contains the kth input series,
%
% M		=	scalar, memory length of the Volterra system,
%
% d 	=	scalar, maximal degree of the truncated Volterra series. 	
%
% Reference
% ---------
%
% 07/2016, Kim Batselier


[N,p]=size(u);
U=zeros(N,(p*M+1)^d);
u=[zeros(M-1,p);u];
for i=M:N+M-1            
	temp=ones(1,p*M+1);
    for j=1:M
        temp(2+(j-1)*p:2+j*p-1)=u(i-j+1,:);                
    end    
	U(i-M+1,:)=mkron(temp,d);
end

end
