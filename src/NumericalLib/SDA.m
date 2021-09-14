%%  Steepest Descent Algorithm by SHAHROKH SHAHI
%   Structural Design Optimization Course
%   shahi@gatech.edu
%
%   Georgia Institute of Technology
%   Spring 2018

%% Function Definition

function solutions = SDA(func,gfunc,x0,tol,max_iter,alpha)
if alpha <=0
    alpha_calc = 1;
else
    alpha_calc = 0;
end

disp('----------- Iterative  Prcedure ------------')
solutions(1,:)=x0;
c(:,1) = gfunc(x0);
norm_c = norm(c(:,1));
if norm(c(:,1)) < tol 
    fprintf ('Stopping criterion is satisfied \n')
    fprintf ('x0 is an optimum point \n')
else
    fprintf('iter = %2d ----- ||c||= %6.3f\n',1,norm_c)
    x = x0;
    d(:,1) = -c(:,1);
    % iterative procedure
    for k = 2 : max_iter
        disp('----------------------------------')
        c(:,k) = gfunc(x); 
        norm_c = norm(c(:,k));
        if norm(c(:,k)) < tol 
            fprintf ('Stopping criterion is satisfied: k=%d \n',k-1)
            break;
        end
%         beta = (  norm(c(:,k))  /  norm(c(:,k-1))  ).^2
%         d(:,k) = -c(:,k) + beta * d(:,k-1) 
        d(:,k) = -c(:,k);
        
        % calculating alpha
        if alpha_calc
            syms a
            xk = x+ a*d(:,k);
            f1 = func(xk);
            alpha = fminsearch (inline(f1),0);
        end
        
        % updating the design
        x ;
        s = alpha * d(:,k);
        x = x + alpha * d(:,k);
        solutions(k,:)=x;
        fprintf('iter = %2d ----- ||c||= %6.3f\n',k,norm_c)
    end
end