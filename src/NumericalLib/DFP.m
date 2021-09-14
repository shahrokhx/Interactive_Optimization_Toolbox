%%  DFP Method by SHAHROKH SHAHI
%   Structural Design Optimization Course
%   shahi@gatech.edu
%
%   Georgia Institute of Technology
%   Spring 2018

%% Function Definition
function solutions = DFP(func,gfunc,x0,A0,tol,max_iter,alpha)
    if alpha <=0
        alpha_calc = 1;
    else
        alpha_calc = 0;
    end

%   alpha = 0.5;
    A = A0;
    k = 1;
    x = zeros(2,max_iter+1);
    x(:,k) = x0;
    solutions(1,:) = x(:,k);
    for k = 1 : max_iter
        d = -A*gfunc(x(:,k));
        % calculating alpha
        if alpha_calc
            syms a
            xk = x(:,k)+ a*d;
            f1 = func(xk);
            alpha = fminsearch (inline(f1),0);
        end
        s = alpha * d;
        x(:,k+1) = x(:,k) + s;
        solutions(k+1,:)=x(:,k+1);
        norm1 = norm(x(:,k+1) - x(:,k));
        norm2 = norm(gfunc(x(:,k+1)));
        fprintf('iter = %2d --> x={%6.3f , %6.3f} --> norm1 = %6.3f   norm2 = %6.3f \n',k,x(1,k),x(2,k),norm1,norm2)
        if (norm1 < tol) || (norm2 < tol)
            break;
        end
        y = gfunc(x(:,k+1)) - gfunc(x(:,k));

        % update hessian matrix
        A = A +   (s*s')./(s'*y)   -   (A*y*y'*A)./(y'*A*y);
    end
    fprintf ('\nX_OPT = {%4.2f , %4.2f} \n',x(1,k),x(2,k))
    disp ('Hessian Matrix Approximation at the End of DFP procedure [A] = ');
    disp (A)
    
end